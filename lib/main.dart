import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

import 'app/resources/app_strings.dart';
import 'app/resources/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MakeItHappenApp());
}

class MakeItHappenApp extends StatelessWidget {
  const MakeItHappenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();
        final width = MediaQuery.of(context).size.width;
        final constrainedWidth = width >= 700 ? math.min(500.0, width) : width;
        return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: constrainedWidth,
            child: child,
          ),
        );
      },
    );
  }
}
