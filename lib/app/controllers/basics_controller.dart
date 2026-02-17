import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class BasicsController extends GetxController {
  final genders = ['Male', 'Female', 'Non-binary'].obs;
  final countries = ['United States', 'Canada', 'United Kingdom'].obs;
  final states = ['California', 'New York', 'Texas'].obs;
  final selectedGender = ''.obs;
  final selectedCountry = ''.obs;
  final selectedState = ''.obs;
  final dobController = TextEditingController(text: '');
  final canSubmit = false.obs;

  @override
  void onInit() {
    super.onInit();
    _evaluate();
  }

  void setGender(String value) {
    selectedGender.value = value;
    _evaluate();
  }

  void setDob(String value) {
    dobController.text = value;
    _evaluate();
  }

  void setCountry(String value) {
    selectedCountry.value = value;
    _evaluate();
  }

  void setState(String value) {
    selectedState.value = value;
    _evaluate();
  }

  void _evaluate() {
    final filled = selectedGender.isNotEmpty &&
        dobController.text.isNotEmpty &&
        selectedCountry.isNotEmpty &&
        selectedState.isNotEmpty;
    canSubmit.value = filled;
  }

  void onPickDate() {
    setDob('12/07/2000');
  }

  void onNext() {
    if (canSubmit.value) {
      Get.toNamed(AppRoutes.intention);
    }
  }

  void onSkip() {
    Get.toNamed(AppRoutes.intention);
  }

  void onBack() {
    Get.back();
  }
}
