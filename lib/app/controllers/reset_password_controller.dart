import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController(text: 'password');
  final confirmPasswordController = TextEditingController(text: 'password');
  final isNewHidden = true.obs;
  final isConfirmHidden = true.obs;
  final canSubmit = true.obs;

  @override
  void onInit() {
    super.onInit();
    _evaluateForm();
  }

  void toggleNewVisibility() {
    isNewHidden.value = !isNewHidden.value;
  }

  void toggleConfirmVisibility() {
    isConfirmHidden.value = !isConfirmHidden.value;
  }

  void onFieldChanged(String _) {
    _evaluateForm();
  }

  void _evaluateForm() {
    canSubmit.value = true;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    if (value.trim().length < 6) {
      return 'Minimum 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Confirm your password';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void onReset() {
    Get.toNamed(AppRoutes.login);
  }

  void onBack() {
    Get.back();
  }
}
