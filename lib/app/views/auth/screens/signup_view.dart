import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/controllers/auth/signup_controller.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_strings.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/app_text_field.dart';
import 'package:make_it_happen/app/widgets/bottom_sheet_container.dart';
import 'package:make_it_happen/app/widgets/gradient_scaffold.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      padding: EdgeInsets.zero,
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
                AppStrings.createAccountTitle,
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: AppDimens.spacing6),
              Text(AppStrings.createAccountSubtitle, style: AppTextStyles.body),
              const SizedBox(height: AppDimens.spacing20),
              AppTextField(
                label: AppStrings.name,
                controller: controller.nameController,
                validator: controller.validateName,
                onChanged: controller.onFieldChanged,
                hintText: AppStrings.hintName,
                prefixIcon: const Icon(
                  LucideIcons.user,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppDimens.spacing12),
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
              const SizedBox(height: AppDimens.spacing12),
              AppTextField(
                label: AppStrings.phoneNumber,
                controller: controller.phoneController,
                validator: controller.validatePhone,
                onChanged: controller.onFieldChanged,
                hintText: AppStrings.hintPhone,
                prefixIcon: const Icon(
                  LucideIcons.phone,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppDimens.spacing12),
              Obx(
                () => AppTextField(
                  label: AppStrings.password,
                  controller: controller.passwordController,
                  validator: controller.validatePassword,
                  onChanged: controller.onFieldChanged,
                  obscureText: controller.isPasswordHidden.value,
                  hintText: AppStrings.hintPassword,
                  prefixIcon: const Icon(
                    LucideIcons.lock,
                    color: AppColors.textSecondary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: controller.togglePasswordVisibility,
                    icon: Icon(
                      controller.isPasswordHidden.value
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
                  label: AppStrings.createAccount,
                  onPressed: controller.onCreateAccount,
                  isEnabled: controller.canSubmit.value,
                ),
              ),
              const SizedBox(height: AppDimens.spacing16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAccount,
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
    );
  }
}


