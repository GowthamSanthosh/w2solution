import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'registration_controller.dart';
import 'registration_form.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.registrationList.length,
          itemBuilder: (context, index) {
            var item = controller.registrationList[index];
            return ListTile(
              title: Text(item['name']!),
              subtitle: Text('${item['city']}, ${item['state']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => controller.updateData(index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.deleteData(index),
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          controller.clearFields();
          Get.to(RegistrationFormPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
