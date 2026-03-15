import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/controllers/auth/forgot_password_controller.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_strings.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/app_text_field.dart';
import 'package:make_it_happen/app/widgets/bottom_sheet_container.dart';
import 'package:make_it_happen/app/widgets/divider_with_text.dart';
import 'package:make_it_happen/app/widgets/gradient_scaffold.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/social_button.dart';
import 'package:make_it_happen/app/widgets/top_bar.dart';

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
                    Text(
                      AppStrings.getBackTitle,
                      style: AppTextStyles.titleLarge,
                    ),
                    const SizedBox(height: AppDimens.spacing6),
                    Text(AppStrings.getBackSubtitle, style: AppTextStyles.body),
                    const SizedBox(height: AppDimens.spacing20),
                    AppTextField(
                      label: AppStrings.email,
                      controller: controller.emailController,
                      validator: controller.validateEmail,
                      onChanged: controller.onFieldChanged,
                      hintText: AppStrings.hintEmail,
                      prefixIcon: const Icon(
                        LucideIcons.mail,
                        color: AppColors.textSecondary,
                      ),
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
                    SocialButton(
                      label: AppStrings.google,
                      onPressed: controller.onGoogle,
                    ),
                    const SizedBox(height: AppDimens.spacing16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.rememberAccount,
                          style: AppTextStyles.bodySmall,
                        ),
                        const SizedBox(width: AppDimens.spacing6),
                        GestureDetector(
                          onTap: controller.onLogin,
                          child: Text(
                            AppStrings.loginLower,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primary,
                            ),
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


