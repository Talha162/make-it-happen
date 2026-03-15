import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/controllers/onboarding/basics_controller.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_constants.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_strings.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/app_dropdown_field.dart';
import 'package:make_it_happen/app/widgets/app_text_field.dart';
import 'package:make_it_happen/app/widgets/dark_scaffold.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/progress_dots.dart';
import 'package:make_it_happen/app/widgets/top_bar.dart';

class OnboardingBasicsView extends GetView<BasicsController> {
  const OnboardingBasicsView({super.key});

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
            activeIndex: AppConstants.onboardingBasicsIndex,
          ),
          const SizedBox(height: AppDimens.spacing20),
          Text(
            AppStrings.startWithBasics,
            style: AppTextStyles.titleLarge.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.startWithBasicsSubtitle, style: AppTextStyles.body),
          const SizedBox(height: AppDimens.spacing20),
          Obx(
            () => AppDropdownField(
              label: '${AppStrings.gender} *',
              hintText: AppStrings.hintGender,
              items: controller.genders,
              value: controller.selectedGender.value,
              onChanged: (value) => controller.setGender(value ?? ''),
            ),
          ),
          const SizedBox(height: AppDimens.spacing12),
          AppTextField(
            label: '${AppStrings.dateOfBirth} *',
            controller: controller.dobController,
            hintText: AppStrings.hintDob,
            readOnly: true,
            onTap: controller.onPickDate,
            suffixIcon: const Icon(
              LucideIcons.calendar,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppDimens.spacing12),
          Obx(
            () => AppDropdownField(
              label: '${AppStrings.country} *',
              hintText: AppStrings.hintCountry,
              items: controller.countries,
              value: controller.selectedCountry.value,
              onChanged: (value) => controller.setCountry(value ?? ''),
            ),
          ),
          const SizedBox(height: AppDimens.spacing12),
          Obx(
            () => AppDropdownField(
              label: '${AppStrings.stateCity} *',
              hintText: AppStrings.hintState,
              items: controller.states,
              value: controller.selectedState.value,
              onChanged: (value) => controller.setState(value ?? ''),
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


