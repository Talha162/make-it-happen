import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Glahen Paul');
  final emailController = TextEditingController(text: 'glahenspaul@gmail.com');
  final phoneController = TextEditingController(text: '+93343828233');
  final passwordController = TextEditingController(text: 'password');
  final isPasswordHidden = true.obs;
  final canSubmit = true.obs;

  @override
  void onInit() {
    super.onInit();
    _evaluateForm();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void onFieldChanged(String _) {
    _evaluateForm();
  }

  void _evaluateForm() {
    canSubmit.value = true;
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    return null;
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

  void onCreateAccount() {
    Get.toNamed(AppRoutes.verify);
  }

  void onLogin() {
    Get.toNamed(AppRoutes.login);
  }
}
