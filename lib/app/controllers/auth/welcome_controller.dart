import 'package:get/get.dart';

import 'package:make_it_happen/app/routes/app_routes.dart';

class WelcomeController extends GetxController {
  void onLogin() {
    Get.toNamed(AppRoutes.login);
  }

  void onCreateAccount() {
    Get.toNamed(AppRoutes.signup);
  }
}
