import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'country_list_controller.dart';

class CountryListPage extends StatelessWidget {
  final CountryListController controller = Get.put(CountryListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => controller.filterCountries(value),
              decoration: const InputDecoration(
                labelText: 'Search Country',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Country',
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.filteredCountries.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: controller.filteredCountries.length,
                  itemBuilder: (context, index) {
                    var country = controller.filteredCountries[index];
                    return ExpansionTile(
                      leading: Image.network(
                        country['flags']['png'],
                        width: 50.0,
                        height: 30.0,
                        fit: BoxFit.cover,
                      ),
                      title: Text(country['name']['common']),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Capital: ${country['capital']?.first ?? 'N/A'}'),
                        ),
                      ],
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
