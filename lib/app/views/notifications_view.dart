import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_scaffold.dart';
import '../widgets/settings_switch_tile.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.notifications,compact: true,),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.notifications, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          Obx(
            () => Column(
              children: [
                SettingsSwitchTile(
                  label: 'Match Updates',
                  value: controller.matchUpdates.value,
                  onChanged: (value) => controller.matchUpdates.value = value,
                ),
                const SizedBox(height: AppDimens.spacing10),
                SettingsSwitchTile(
                  label: 'Learning & Courses',
                  value: controller.learningCourses.value,
                  onChanged: (value) => controller.learningCourses.value = value,
                ),
                const SizedBox(height: AppDimens.spacing10),
                SettingsSwitchTile(
                  label: 'Mentorship',
                  value: controller.mentorship.value,
                  onChanged: (value) => controller.mentorship.value = value,
                ),
                const SizedBox(height: AppDimens.spacing10),
                SettingsSwitchTile(
                  label: 'Events & Hangouts',
                  value: controller.eventsHangouts.value,
                  onChanged: (value) => controller.eventsHangouts.value = value,
                ),
                const SizedBox(height: AppDimens.spacing10),
                SettingsSwitchTile(
                  label: 'Subscription & Payments',
                  value: controller.subscriptionPayments.value,
                  onChanged: (value) => controller.subscriptionPayments.value = value,
                ),
                const SizedBox(height: AppDimens.spacing10),
                SettingsSwitchTile(
                  label: 'Safety & Account',
                  value: controller.safetyAccount.value,
                  onChanged: (value) => controller.safetyAccount.value = value,
                ),
                const SizedBox(height: AppDimens.spacing10),
                SettingsSwitchTile(
                  label: 'Email Notifications',
                  value: controller.emailNotifications.value,
                  onChanged: (value) => controller.emailNotifications.value = value,
                ),
                const SizedBox(height: AppDimens.spacing10),
                SettingsSwitchTile(
                  label: 'System Rules',
                  value: controller.systemRules.value,
                  onChanged: (value) => controller.systemRules.value = value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
