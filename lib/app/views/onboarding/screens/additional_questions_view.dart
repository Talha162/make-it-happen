import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/controllers/onboarding/additional_questions_controller.dart';
import 'package:make_it_happen/app/resources/app_constants.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_strings.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/app_multiline_field.dart';
import 'package:make_it_happen/app/widgets/dark_scaffold.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/progress_dots.dart';
import 'package:make_it_happen/app/widgets/radio_option.dart';
import 'package:make_it_happen/app/widgets/top_bar.dart';

class AdditionalQuestionsView extends GetView<AdditionalQuestionsController> {
  const AdditionalQuestionsView({super.key});

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
            activeIndex: AppConstants.onboardingAdditionalIndex,
          ),
          const SizedBox(height: AppDimens.spacing20),
          Text(
            AppStrings.additionalQuestions,
            style: AppTextStyles.titleLarge.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
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
                  selected:
                      controller.mentorshipSelection.value == AppStrings.yes,
                  onTap: () => controller.setMentorship(AppStrings.yes),
                ),
                const SizedBox(width: AppDimens.spacing16),
                RadioOption(
                  label: AppStrings.no,
                  selected:
                      controller.mentorshipSelection.value == AppStrings.no,
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


