import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/additional_questions_controller.dart';
import '../resources/app_constants.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/app_multiline_field.dart';
import '../widgets/dark_scaffold.dart';
import '../widgets/primary_button.dart';
import '../widgets/progress_dots.dart';
import '../widgets/radio_option.dart';
import '../widgets/top_bar.dart';

class AdditionalQuestionsView extends GetView<AdditionalQuestionsController> {
  const AdditionalQuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DarkScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(onBack: controller.onBack, onSkip: controller.onSkip, showSkip: true),
          const SizedBox(height: AppDimens.spacing8),
          const ProgressDots(
            count: AppConstants.onboardingSteps,
            activeIndex: AppConstants.onboardingAdditionalIndex,
          ),
          const SizedBox(height: AppDimens.spacing20),
          Text(AppStrings.additionalQuestions, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.additionalSubtitle, style: AppTextStyles.body),
          const SizedBox(height: AppDimens.spacing20),
          Text(AppStrings.mentorshipQuestion, style: AppTextStyles.label),
          const SizedBox(height: AppDimens.spacing8),
          Obx(
            () => Row(
              children: [
                RadioOption(
                  label: AppStrings.yes,
                  selected: controller.mentorshipSelection.value == AppStrings.yes,
                  onTap: () => controller.setMentorship(AppStrings.yes),
                ),
                const SizedBox(width: AppDimens.spacing16),
                RadioOption(
                  label: AppStrings.no,
                  selected: controller.mentorshipSelection.value == AppStrings.no,
                  onTap: () => controller.setMentorship(AppStrings.no),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimens.spacing16),
          AppMultilineField(
            label: AppStrings.guidanceSeeking,
            controller: controller.guidanceController,
            hintText: AppStrings.guidancePlaceholder,
            onChanged: controller.onGuidanceChanged,
          ),
          const Spacer(),
          Obx(
            () => PrimaryButton(
              label: AppStrings.done,
              onPressed: controller.onDone,
              isEnabled: controller.canSubmit.value,
            ),
          ),
        ],
      ),
    );
  }
}
