import 'package:get/get.dart';

import 'package:make_it_happen/app/routes/bottom_nav.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';

class ProfileController extends GetxController {
  final RxInt navIndex = 4.obs;

  void onNavTap(int index) {
    navIndex.value = index;
    BottomNav.onTap(
      index: index,
      currentRoute: AppRoutes.profile,
      matchRoute: AppRoutes.matchSuggestionsBlocked,
      eventsRoute: AppRoutes.eventEmpty,
    );
  }

  void openLocation() => Get.toNamed(AppRoutes.locationDetails);
  void openRelationship() => Get.toNamed(AppRoutes.relationship);
  void openPreferences() => Get.toNamed(AppRoutes.preferences);
  void openMentorship() =>
      Get.toNamed(AppRoutes.mentorshipSessions);
  void openNotifications() => Get.toNamed(AppRoutes.notifications);
  void openSubscription() => Get.toNamed(AppRoutes.activePlan);
  void openSupport() => Get.toNamed(AppRoutes.supportSafety);
  void openAccount() => Get.toNamed(AppRoutes.accountSettings);
  void openTerms() => Get.toNamed(AppRoutes.terms);
}
