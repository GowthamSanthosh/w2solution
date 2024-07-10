import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'registration_form.dart';


class RegistrationController extends GetxController {
  var registrationList = <Map<String, String>>[].obs;
  var nameController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var isUpdate = false.obs;
  var updateIndex = (-1).obs;

  void saveData() {
    if (isUpdate.value) {
      registrationList[updateIndex.value] = {
        'name': nameController.text,
        'city': cityController.text,
        'state': stateController.text,
      };
    } else {
      registrationList.add({
        'name': nameController.text,
        'city': cityController.text,
        'state': stateController.text,
      });
    }
    clearFields();
  }

  void updateData(int index) {
    isUpdate.value = true;
    updateIndex.value = index;
    nameController.text = registrationList[index]['name']!;
    cityController.text = registrationList[index]['city']!;
    stateController.text = registrationList[index]['state']!;
    Get.to(() => RegistrationFormPage());
  }

  void deleteData(int index) {
    registrationList.removeAt(index);
  }

  void clearFields() {
    nameController.clear();
    cityController.clear();
    stateController.clear();
    isUpdate.value = false;
    updateIndex.value = -1;
  }
}
