import 'package:get/get.dart';

void showDemoSaved([String message = 'Changes saved locally for demo mode.']) {
  Get.snackbar(
    'Saved',
    message,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 2),
  );
}

void showDemoAction(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 2),
  );
}
