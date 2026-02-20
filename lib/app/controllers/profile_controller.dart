import 'package:get/get.dart';

import '../routes/app_routes.dart';

class ProfileController extends GetxController {
  final RxInt navIndex = 4.obs;

  void onNavTap(int index) {
    navIndex.value = index;
    if (index == 0) {
      Get.toNamed(AppRoutes.home);
    } else if (index == 1) {
      Get.toNamed(AppRoutes.learn);
    } else if (index == 3) {
      Get.toNamed(AppRoutes.eventEmpty);
    } else if (index == 2) {
      Get.toNamed(AppRoutes.matchSuggestionsBlocked);
    } else if (index == 4) {
      Get.toNamed(AppRoutes.profile);
    }
  }

  void openLocation() => Get.toNamed(AppRoutes.locationDetails);
  void openRelationship() => Get.toNamed(AppRoutes.relationship);
  void openPreferences() => Get.toNamed(AppRoutes.preferences);
  void openMentorship() => Get.toNamed(AppRoutes.mentorshipSessions);
  void openNotifications() => Get.toNamed(AppRoutes.notifications);
  void openSubscription() => Get.toNamed(AppRoutes.activePlan);
  void openSupport() => Get.toNamed(AppRoutes.supportSafety);
  void openAccount() => Get.toNamed(AppRoutes.accountSettings);
  void openEditProfile() => Get.toNamed(AppRoutes.editProfile);
  void openTerms() => Get.toNamed(AppRoutes.terms);
}
