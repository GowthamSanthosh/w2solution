import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryListController extends GetxController {
  var countries = [].obs;
  var filteredCountries = [].obs;

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  void fetchCountries() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      countries.value = json.decode(response.body);
      filteredCountries.value = countries; // Initialize filteredCountries with all countries
    } else {
      throw Exception('Failed to load countries');
    }
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries.value = countries;
    } else {
      filteredCountries.value = countries
          .where((country) => country['name']['common'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
