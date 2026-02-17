import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../controllers/forgot_password_controller.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/app_text_field.dart';
import '../widgets/bottom_sheet_container.dart';
import '../widgets/divider_with_text.dart';
import '../widgets/gradient_scaffold.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import '../widgets/top_bar.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

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
                  Text(AppStrings.getBackTitle, style: AppTextStyles.titleLarge),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(AppStrings.getBackSubtitle, style: AppTextStyles.body),
                  const SizedBox(height: AppDimens.spacing20),
                  AppTextField(
                    label: AppStrings.email,
                    controller: controller.emailController,
                    validator: controller.validateEmail,
                    onChanged: controller.onFieldChanged,
                    hintText: AppStrings.hintEmail,
                    prefixIcon: const Icon(LucideIcons.mail, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Obx(
                    () => PrimaryButton(
                      label: AppStrings.sendResetLink,
                      onPressed: controller.onSendReset,
                      isEnabled: controller.canSubmit.value,
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  const DividerWithText(text: AppStrings.or),
                  const SizedBox(height: AppDimens.spacing16),
                  SocialButton(label: AppStrings.google, onPressed: controller.onGoogle),
                  const SizedBox(height: AppDimens.spacing16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.rememberAccount, style: AppTextStyles.bodySmall),
                      const SizedBox(width: AppDimens.spacing6),
                      GestureDetector(
                        onTap: controller.onLogin,
                        child: Text(
                          AppStrings.loginLower,
                          style: AppTextStyles.bodySmall.copyWith(color: AppColors.primary),
                        ),
                      ),
                    ],
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
