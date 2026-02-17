import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/gradient_scaffold.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return GradientScaffold(
      child: Center(
        child: Text(AppStrings.appName, style: AppTextStyles.splashTitle),
      ),
    );
  }
}
