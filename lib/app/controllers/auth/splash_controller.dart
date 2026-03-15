import 'package:get/get.dart';

import 'package:make_it_happen/app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (Get.currentRoute == AppRoutes.splash) {
        Get.offNamed(AppRoutes.welcome);
      }
    });
  }
}
