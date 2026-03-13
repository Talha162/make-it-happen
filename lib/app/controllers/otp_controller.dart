import 'package:get/get.dart';

import '../routes/app_routes.dart';

class OtpController extends GetxController {
  final int otpLength = 5;
  final otpValues = <String>[].obs;
  final showError = false.obs;
  final canSubmit = true.obs;
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
    if (showError.value) {
      showError.value = false;
    }
    _evaluate();
  }

  void _evaluate() {
    canSubmit.value = true;
  }

  void onVerify() {
    showError.value = false;
    Get.offAllNamed(AppRoutes.basics);
  }

  void onResend() {
    showError.value = false;
  }

  void onBack() {
    Get.back();
  }
}
