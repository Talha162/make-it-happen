import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'glahenspaul@gmail.com');
  final passwordController = TextEditingController(text: 'password');
  final isPasswordHidden = true.obs;
  final canSubmit = false.obs;

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
    canSubmit.value = formKey.currentState?.validate() ?? false;
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

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    if (value.trim().length < 6) {
      return 'Minimum 6 characters';
    }
    return null;
  }

  void onLogin() {
    if (formKey.currentState?.validate() ?? false) {
      Get.offAllNamed(AppRoutes.home);
    }
  }

  void onForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  void onSignup() {
    Get.toNamed(AppRoutes.signup);
  }

  void onGoogle() {}
}
