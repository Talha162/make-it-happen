import 'package:get/get.dart';

import 'app_routes.dart';

abstract class BottomNav {
  static const int homeIndex = 0;
  static const int learnIndex = 1;
  static const int matchIndex = 2;
  static const int eventsIndex = 3;
  static const int profileIndex = 4;

  static void onTap({
    required int index,
    required String currentRoute,
    String matchRoute = AppRoutes.matchSuggestions,
    String eventsRoute = AppRoutes.events,
  }) {
    final targetRoute = switch (index) {
      homeIndex => AppRoutes.home,
      learnIndex => AppRoutes.learn,
      matchIndex => matchRoute,
      eventsIndex => eventsRoute,
      profileIndex => AppRoutes.profile,
      _ => null,
    };

    if (targetRoute == null || targetRoute == currentRoute) {
      return;
    }

    // Replace tab screens instead of stacking duplicates on every tap.
    Get.offNamed(targetRoute);
  }
}
