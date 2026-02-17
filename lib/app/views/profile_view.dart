import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../controllers/profile_controller.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/profile_bottom_nav.dart';
import '../widgets/profile_menu_tile.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      bottomNavigationBar: Obx(
        () => ProfileBottomNav(
          currentIndex: controller.navIndex.value,
          onTap: controller.onNavTap,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.screenPadding,
            vertical: AppDimens.spacing16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppDimens.spacing12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
                      ),
                    ),
                    const SizedBox(width: AppDimens.spacing12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Glahens Paul', style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
                          const SizedBox(height: 2),
                          Text('glahenspaul@gmail.com', style: AppTextStyles.bodySmall),
                        ],
                      ),
                    ),
                    Text(
                      'Edit',
                      style: AppTextStyles.body.copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.spacing20),
              Text(AppStrings.profileSettings, style: AppTextStyles.titleMedium),
              const SizedBox(height: AppDimens.spacing12),
              ProfileMenuTile(
                icon: LucideIcons.mapPin,
                label: 'Location',
                onTap: controller.openLocation,
              ),
              const SizedBox(height: AppDimens.spacing10),
              ProfileMenuTile(
                icon: LucideIcons.users,
                label: 'Relationship',
                onTap: controller.openRelationship,
              ),
              const SizedBox(height: AppDimens.spacing10),
              ProfileMenuTile(
                icon: LucideIcons.sliders,
                label: 'Preferences',
                onTap: controller.openPreferences,
              ),
              const SizedBox(height: AppDimens.spacing10),
              ProfileMenuTile(
                icon: LucideIcons.calendarDays,
                label: 'Mentor Bookings',
                onTap: controller.openMentorship,
              ),
              const SizedBox(height: AppDimens.spacing10),
              ProfileMenuTile(
                icon: LucideIcons.bell,
                label: 'Notifications',
                onTap: controller.openNotifications,
              ),
              const SizedBox(height: AppDimens.spacing10),
              ProfileMenuTile(
                icon: LucideIcons.creditCard,
                label: 'Subscription',
                onTap: controller.openSubscription,
              ),
              const SizedBox(height: AppDimens.spacing10),
              ProfileMenuTile(
                icon: LucideIcons.shieldCheck,
                label: 'Support & Safety',
                onTap: controller.openSupport,
              ),
              const SizedBox(height: AppDimens.spacing10),
              ProfileMenuTile(
                icon: LucideIcons.fileText,
                label: 'Terms & Conditions',
                onTap: () {},
              ),
              const SizedBox(height: AppDimens.spacing10),
              ProfileMenuTile(
                icon: LucideIcons.logOut,
                label: 'Logout',
                onTap: () => _showLogoutDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
          padding: const EdgeInsets.all(AppDimens.spacing16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(LucideIcons.logOut, size: 16, color: AppColors.white),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(LucideIcons.x, color: AppColors.textMuted, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.spacing12),
              Text('Log Out?', style: AppTextStyles.titleMedium),
              const SizedBox(height: AppDimens.spacing6),
              Text("You'll need to sign in again to continue.", style: AppTextStyles.body),
              const SizedBox(height: AppDimens.spacing16),
              SizedBox(
                width: double.infinity,
                height: AppDimens.buttonHeight,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
                    ),
                  ),
                  child: Text('Log Out', style: AppTextStyles.button),
                ),
              ),
              const SizedBox(height: AppDimens.spacing10),
              SizedBox(
                width: double.infinity,
                height: AppDimens.buttonHeight,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
                      side: const BorderSide(color: AppColors.border),
                    ),
                  ),
                  child: Text('Cancel', style: AppTextStyles.buttonDark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
