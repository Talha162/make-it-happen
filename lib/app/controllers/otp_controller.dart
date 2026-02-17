import 'package:get/get.dart';

import '../routes/app_routes.dart';

class OtpController extends GetxController {
  final int otpLength = 6;
  final otpValues = <String>[].obs;
  final showError = false.obs;
  final canSubmit = false.obs;
  final timerLabel = '00:30 Sec'.obs;

  @override
  void onInit() {
    super.onInit();
    otpValues.assignAll(List.generate(otpLength, (_) => ''));
    _evaluate();
  }

  void setDigit(int index, String value) {
    if (index < 0 || index >= otpValues.length) {
      return;
    }
    otpValues[index] = value;
    _evaluate();
  }

  void _evaluate() {
    final filled = otpValues.every((digit) => digit.isNotEmpty);
    canSubmit.value = filled;
  }

  void onVerify() {
    showError.value = false;
    Get.offAllNamed(AppRoutes.profile);
  }

  void onResend() {
    showError.value = false;
  }

  void onBack() {
    Get.back();
  }
}
