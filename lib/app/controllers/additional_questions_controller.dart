import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class AdditionalQuestionsController extends GetxController {
  final guidanceController = TextEditingController();
  final mentorshipSelection = ''.obs;
  final canSubmit = false.obs;

  void setMentorship(String value) {
    mentorshipSelection.value = value;
    _evaluate();
  }

  void onGuidanceChanged(String _) {
    _evaluate();
  }

  void _evaluate() {
    canSubmit.value = mentorshipSelection.isNotEmpty;
  }

  void onDone() {
    if (canSubmit.value) {
      Get.offAllNamed(AppRoutes.home);
    }
  }

  void onSkip() {
    Get.offAllNamed(AppRoutes.home);
  }

  void onBack() {
    Get.back();
  }
}
