import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/controllers/onboarding/intention_controller.dart';
import 'package:make_it_happen/app/resources/app_constants.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_strings.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/app_dropdown_field.dart';
import 'package:make_it_happen/app/widgets/dark_scaffold.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/progress_dots.dart';
import 'package:make_it_happen/app/widgets/selection_chip.dart';
import 'package:make_it_happen/app/widgets/top_bar.dart';

class IntentionView extends GetView<IntentionController> {
  const IntentionView({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(
            onBack: controller.onBack,
            onSkip: controller.onSkip,
            showSkip: true,
          ),
          const SizedBox(height: AppDimens.spacing8),
          const ProgressDots(
            count: AppConstants.onboardingSteps,
            activeIndex: AppConstants.onboardingIntentionIndex,
          ),
          const SizedBox(height: AppDimens.spacing20),
          Text(
            AppStrings.yourIntention,
            style: AppTextStyles.titleLarge.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.intentionSubtitle, style: AppTextStyles.body),
          const SizedBox(height: AppDimens.spacing20),
          Text.rich(
            TextSpan(
              style: AppTextStyles.label.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
              children: const [
                TextSpan(text: AppStrings.relationshipGoal),
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: AppColors.error),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimens.spacing8),
          Obx(
            () => Wrap(
              spacing: AppDimens.spacing8,
              runSpacing: AppDimens.spacing8,
              children: List.generate(controller.relationshipGoals.length, (
                index,
              ) {
                final goal = controller.relationshipGoals[index];
                return SelectionChip(
                  label: goal.label,
                  selected: goal.selected,
                  onTap: () => controller.toggleGoal(index),
                );
              }),
            ),
          ),
          const SizedBox(height: AppDimens.spacing16),
          Obx(
            () => AppDropdownField(
              label: '${AppStrings.preferredAgeRange} *',
              hintText: AppStrings.hintAgeRange,
              items: controller.ageRanges,
              value: controller.selectedAgeRange.value,
              onChanged: (value) => controller.setAgeRange(value ?? ''),
            ),
          ),
          const SizedBox(height: AppDimens.spacing12),
          Obx(
            () => AppDropdownField(
              label: '${AppStrings.preferredLocation} *',
              hintText: AppStrings.hintLocation,
              items: controller.locations,
              value: controller.selectedLocation.value,
              onChanged: (value) => controller.setLocation(value ?? ''),
            ),
          ),
          const Spacer(),
          Obx(
            () => PrimaryButton(
              label: AppStrings.next,
              onPressed: controller.onNext,
              isEnabled: controller.canSubmit.value,
            ),
          ),
        ],
      ),
    );
  }
}


