import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/controllers/auth/splash_controller.dart';
import 'package:make_it_happen/app/resources/app_strings.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/gradient_scaffold.dart';

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


