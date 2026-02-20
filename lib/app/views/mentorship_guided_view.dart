import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/primary_button.dart';

class MentorshipGuidedView extends StatelessWidget {
  const MentorshipGuidedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back, color: AppColors.white),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
                children: [
                  const SizedBox(height: AppDimens.spacing6),
                  Text('Guided Mentorship', style: AppTextStyles.titleLarge),
                  const SizedBox(height: AppDimens.spacing20),
                  Text('Choose a Topic', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      _TopicChip(label: 'Pre-marriage preparation'),
                      _TopicChip(label: 'Conflict resolution'),
                      _TopicChip(label: 'Family involvement'),
                      _TopicChip(label: 'Effective communication'),
                      _TopicChip(
                        label: 'General mentorship',
                        isSelected: true,
                        showCheck: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.spacing20),
                  Text('Choose Date', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing10),
                  _Field(
                    value: '17 Feb, 2026',
                    trailing: const Icon(LucideIcons.calendar, size: 18, color: AppColors.textMuted),
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Choose Time', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing10),
                  _Field(
                    value: '10:00 AM',
                    trailing: const Icon(LucideIcons.clock, size: 18, color: AppColors.textMuted),
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Session Type', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing10),
                  _Field(
                    value: 'Remote',
                    trailing: const Icon(Icons.keyboard_arrow_down, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                0,
                AppDimens.screenPadding,
                AppDimens.spacing24,
              ),
              child: PrimaryButton(
                label: 'Confirm Mentorship',
                isEnabled: true,
                onPressed: () => Get.toNamed(AppRoutes.mentorshipConfirmed),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopicChip extends StatelessWidget {
  const _TopicChip({
    required this.label,
    this.isSelected = false,
    this.showCheck = false,
  });

  final String label;
  final bool isSelected;
  final bool showCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryDark : AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showCheck)
            const Icon(Icons.check, size: 16, color: AppColors.white)
          else
            Icon(Icons.add, size: 16, color: isSelected ? AppColors.white : AppColors.textMuted),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: isSelected ? AppColors.white : AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({required this.value, required this.trailing});

  final String value;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.fieldHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing12),
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(value, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
          ),
          trailing,
        ],
      ),
    );
  }
}
