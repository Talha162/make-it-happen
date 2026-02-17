import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../controllers/reset_password_controller.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/app_text_field.dart';
import '../widgets/bottom_sheet_container.dart';
import '../widgets/gradient_scaffold.dart';
import '../widgets/primary_button.dart';
import '../widgets/top_bar.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          TopBar(onBack: controller.onBack),
          Expanded(
            child: BottomSheetContainer(
              minHeightFactor: 0.60,
              maxHeightFactor: 0.85,
              initialHeightFactor: 0.72,
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(AppStrings.setNewKeyTitle, style: AppTextStyles.titleLarge),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(AppStrings.setNewKeySubtitle, style: AppTextStyles.body),
                  const SizedBox(height: AppDimens.spacing20),
                  Obx(
                    () => AppTextField(
                      label: AppStrings.newPassword,
                      controller: controller.newPasswordController,
                      validator: controller.validatePassword,
                      onChanged: controller.onFieldChanged,
                      obscureText: controller.isNewHidden.value,
                      hintText: AppStrings.hintPassword,
                      prefixIcon: const Icon(LucideIcons.lock, color: AppColors.textSecondary),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleNewVisibility,
                        icon: Icon(
                          controller.isNewHidden.value
                              ? LucideIcons.eyeOff
                              : LucideIcons.eye,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  Obx(
                    () => AppTextField(
                      label: AppStrings.confirmPassword,
                      controller: controller.confirmPasswordController,
                      validator: controller.validateConfirmPassword,
                      onChanged: controller.onFieldChanged,
                      obscureText: controller.isConfirmHidden.value,
                      hintText: AppStrings.hintPassword,
                      prefixIcon: const Icon(LucideIcons.lock, color: AppColors.textSecondary),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleConfirmVisibility,
                        icon: Icon(
                          controller.isConfirmHidden.value
                              ? LucideIcons.eyeOff
                              : LucideIcons.eye,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Obx(
                    () => PrimaryButton(
                      label: AppStrings.reset,
                      onPressed: controller.onReset,
                      isEnabled: controller.canSubmit.value,
                    ),
                  ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
