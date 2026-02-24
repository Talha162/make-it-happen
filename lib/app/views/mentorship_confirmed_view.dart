import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../widgets/primary_button.dart';

class MentorshipConfirmedView extends StatelessWidget {
  const MentorshipConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
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
            const SizedBox(height: AppDimens.spacing12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
              child: Container(
                padding: const EdgeInsets.all(AppDimens.spacing20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Booking Confirmed!', style: AppTextStyles.titleMedium),
                        const SizedBox(width: 6),
                        const CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.primaryDark,
                          child: Icon(Icons.check, size: 12, color: AppColors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.spacing12),
                    _Row(label: 'Topic', value: 'General Mentorship'),
                    _Row(label: 'Date', value: 'June 14, 2025'),
                    _Row(label: 'Time', value: '10:00 AM'),
                    _Row(label: 'Session Type', value: 'Remote', showDivider: false),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                0,
                AppDimens.screenPadding,
                AppDimens.spacing24,
              ),
              child: PrimaryButton(
                label: 'Continue',
                isEnabled: true,
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    this.showDivider = true,
  });

  final String label;
  final String value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted)),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
        if (showDivider) ...[
          const SizedBox(height: 10),
          const Divider(height: 1, color: AppColors.divider),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

