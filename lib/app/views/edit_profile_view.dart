import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_scaffold.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.accountSettings, compact: true),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.accountSettings, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          Text('Upload Picture', style: AppTextStyles.label),
          const SizedBox(height: AppDimens.spacing12),
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage(AppAssets.profileImage),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, size: 12, color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimens.spacing16),
          _Field(
            label: AppStrings.name,
            value: 'Glahen Paul',
            icon: LucideIcons.user,
          ),
          const SizedBox(height: AppDimens.spacing12),
          _Field(
            label: AppStrings.email,
            value: 'glahenspaul@gmail.com',
            icon: LucideIcons.mail,
          ),
          const SizedBox(height: AppDimens.spacing12),
          Row(
            children: [
              Text(AppStrings.password, style: AppTextStyles.label),
              const Spacer(),
              Text('Change', style: AppTextStyles.body.copyWith(color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: AppDimens.spacing8),
          _Field(
            label: '',
            value: '••••••••',
            icon: LucideIcons.lock,
            trailing: const Icon(Icons.visibility_off, color: AppColors.textMuted, size: 16),
          ),
          const SizedBox(height: AppDimens.spacing12),
          _DropdownField(
            label: '${AppStrings.gender} *',
            value: 'Male',
            icon: LucideIcons.userCircle2,
          ),
          const SizedBox(height: AppDimens.spacing12),
          _DropdownField(
            label: '${AppStrings.dateOfBirth} *',
            value: '12/07/2000',
            icon: LucideIcons.calendar,
            trailing: const Icon(Icons.calendar_today, color: AppColors.textMuted, size: 16),
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.value,
    required this.icon,
    this.trailing,
  });

  final String label;
  final String value;
  final IconData icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) Text(label, style: AppTextStyles.label),
        if (label.isNotEmpty) const SizedBox(height: AppDimens.spacing8),
        Container(
          height: AppDimens.fieldHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing12),
          decoration: BoxDecoration(
            color: AppColors.fieldFill,
            borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.textMuted, size: 16),
              const SizedBox(width: AppDimens.spacing10),
              Expanded(
                child: Text(value, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ],
    );
  }
}

class _DropdownField extends StatelessWidget {
  const _DropdownField({
    required this.label,
    required this.value,
    required this.icon,
    this.trailing,
  });

  final String label;
  final String value;
  final IconData icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return _Field(
      label: label,
      value: value,
      icon: icon,
      trailing: trailing ??
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textMuted,
            size: 18,
          ),
    );
  }
}
