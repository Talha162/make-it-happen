import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../controllers/profile_controller.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/profile_bottom_nav.dart';
import '../widgets/profile_menu_tile.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
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
                    GestureDetector(
                      onTap: controller.openEditProfile,
                      child: Text(
                        'Edit',
                        style: AppTextStyles.body.copyWith(color: AppColors.primary),
                      ),
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
                onTap: controller.openTerms,
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
      barrierColor: Colors.black.withOpacity(0.72),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Container(
            padding: const EdgeInsets.all(AppDimens.spacing20),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD8EDFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(LucideIcons.logOut, size: 28, color: AppColors.primaryDark),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(LucideIcons.x, color: AppColors.textPrimary, size: 28),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimens.spacing8),
                Text(
                  'Log Out?',
                  style: AppTextStyles.titleLarge.copyWith(fontSize: 24),
                ),
                const SizedBox(height: AppDimens.spacing8),
                Text(
                  'You will need to sign in again to continue.',
                  style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppDimens.spacing24),
                SizedBox(
                  width: double.infinity,
                  height: AppDimens.buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.offAllNamed(AppRoutes.welcome);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.accent, AppColors.primaryDark],
                        ),
                        borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
                      ),
                      child: Center(
                        child: Text('Log Out', style: AppTextStyles.button),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppDimens.spacing12),
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
      ),
    );
  }
}
