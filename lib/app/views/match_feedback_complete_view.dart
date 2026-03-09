import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/primary_button.dart';

class MatchFeedbackCompleteView extends StatelessWidget {
  const MatchFeedbackCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(LucideIcons.chevronLeft, color: AppColors.white),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppDimens.spacing20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: AppColors.statusCompletedBg,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        LucideIcons.badgeCheck,
                        color: AppColors.statusCompletedText,
                      ),
                    ),
                    const SizedBox(height: AppDimens.spacing16),
                    Text('Feedback submitted', style: AppTextStyles.titleLarge),
                    const SizedBox(height: AppDimens.spacing8),
                    Text(
                      'Your profile has been reactivated for new match suggestions.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: AppDimens.spacing20),
                    PrimaryButton(
                      label: 'View Suggestions',
                      isEnabled: true,
                      onPressed: () => Get.offAllNamed(AppRoutes.matchSuggestions),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
