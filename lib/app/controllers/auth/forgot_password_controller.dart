import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'glahenspaul@gmail.com');
  final canSubmit = true.obs;

  @override
  void onInit() {
    super.onInit();
    _evaluateForm();
  }

  void onFieldChanged(String _) {
    _evaluateForm();
  }

  void _evaluateForm() {
    canSubmit.value = true;
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

  void onSendReset() {
    Get.toNamed(AppRoutes.resetPassword);
  }

  void onLogin() {
    Get.toNamed(AppRoutes.login);
  }

  void onBack() {
    Get.back();
  }

  void onGoogle() {}
}
