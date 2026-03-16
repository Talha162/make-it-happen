import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/widgets/floating_chat_button.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';

class MentorshipConfirmedView extends StatelessWidget {
  const MentorshipConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: AppDimens.spacing16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimens.spacing12),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.screenPadding,
                      ),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Booking Confirmed!',
                                  style: AppTextStyles.titleMedium,
                                ),
                                const SizedBox(width: 8),
                                const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: AppColors.primaryDark,
                                  child: Icon(
                                    Icons.check,
                                    size: 12,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppDimens.spacing16),
                            const _Row(
                              label: 'Topic',
                              value: 'General Mentorship',
                            ),
                            const _Row(label: 'Price:', value: '40'),
                            const _Row(label: 'Date', value: 'June 14, 2025'),
                            const _Row(label: 'Time', value: '10:00 AM'),
                            const _Row(
                              label: 'Session Type',
                              value: 'Remote',
                              showDivider: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.screenPadding,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  FloatingChatButton(
                    onTap: () => Get.toNamed(AppRoutes.mentorshipChat),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimens.spacing16),
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
                onPressed: () => Get.toNamed(AppRoutes.mentorshipChat),
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
        Text(
          label,
          style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (showDivider) ...[
          const SizedBox(height: 10),
          const Divider(height: 1, color: AppColors.divider),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
