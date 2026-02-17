import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/app_text_field.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_dropdown_field.dart';
import '../widgets/profile_scaffold.dart';

class AccountSettingsView extends StatelessWidget {
  AccountSettingsView({super.key});

  final TextEditingController _name = TextEditingController(text: 'Glahen Paul');
  final TextEditingController _email = TextEditingController(text: 'glahenspaul@gmail.com');
  final TextEditingController _password = TextEditingController(text: '********');
  final TextEditingController _dob = TextEditingController(text: '12/07/2000');

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.accountSettings),
          const SizedBox(height: AppDimens.spacing12),
          Text('Upload Picture', style: AppTextStyles.label),
          const SizedBox(height: AppDimens.spacing10),
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=200&q=80',
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.screenBackground, width: 2),
                    ),
                    child: const Icon(LucideIcons.pencil, size: 10, color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimens.spacing16),
          AppTextField(label: 'Name', controller: _name, prefixIcon: const Icon(LucideIcons.user, size: 18)),
          const SizedBox(height: AppDimens.spacing12),
          AppTextField(label: 'Email', controller: _email, prefixIcon: const Icon(LucideIcons.mail, size: 18)),
          const SizedBox(height: AppDimens.spacing12),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  label: 'Password',
                  controller: _password,
                  prefixIcon: const Icon(LucideIcons.lock, size: 18),
                  suffixIcon: const Icon(LucideIcons.eyeOff, size: 18),
                  obscureText: true,
                ),
              ),
              const SizedBox(width: AppDimens.spacing10),
              GestureDetector(
                onTap: () => _showChangePassword(context),
                child: Padding(
                  padding: const EdgeInsets.only(top: AppDimens.spacing24),
                  child: Text('Change', style: AppTextStyles.body.copyWith(color: AppColors.primary)),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacing12),
          ProfileDropdownField(
            label: 'Gender *',
            hintText: 'Male',
            value: 'Male',
            items: const ['Male', 'Female', 'Other'],
            onChanged: (_) {},
          ),
          const SizedBox(height: AppDimens.spacing12),
          AppTextField(
            label: 'Date of Birth *',
            controller: _dob,
            prefixIcon: const Icon(LucideIcons.calendar, size: 18),
            suffixIcon: const Icon(LucideIcons.chevronDown, size: 18),
            readOnly: true,
          ),
        ],
      ),
    );
  }

  void _showChangePassword(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final current = TextEditingController(text: '********');
        final next = TextEditingController(text: '********');
        final confirm = TextEditingController(text: '********');
        return Padding(
          padding: const EdgeInsets.all(AppDimens.spacing16),
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
                    child: const Icon(LucideIcons.lock, size: 16, color: AppColors.white),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(LucideIcons.x, color: AppColors.textMuted, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.spacing12),
              Text('Change Your Password', style: AppTextStyles.titleMedium),
              const SizedBox(height: AppDimens.spacing6),
              Text(
                "For your account's security, enter your current\npassword and set a new one.",
                style: AppTextStyles.body,
              ),
              const SizedBox(height: AppDimens.spacing16),
              AppTextField(
                label: 'Current Password',
                controller: current,
                prefixIcon: const Icon(LucideIcons.lock, size: 18),
                suffixIcon: const Icon(LucideIcons.eyeOff, size: 18),
                obscureText: true,
              ),
              const SizedBox(height: AppDimens.spacing12),
              AppTextField(
                label: 'New Password',
                controller: next,
                prefixIcon: const Icon(LucideIcons.lock, size: 18),
                suffixIcon: const Icon(LucideIcons.eyeOff, size: 18),
                obscureText: true,
              ),
              const SizedBox(height: AppDimens.spacing12),
              AppTextField(
                label: 'Confirm Password',
                controller: confirm,
                prefixIcon: const Icon(LucideIcons.lock, size: 18),
                suffixIcon: const Icon(LucideIcons.eyeOff, size: 18),
                obscureText: true,
              ),
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
                  child: Text('Yes, Change', style: AppTextStyles.button),
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
              const SizedBox(height: AppDimens.spacing12),
            ],
          ),
        );
      },
    );
  }
}
