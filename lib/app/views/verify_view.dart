import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/otp_controller.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/bottom_sheet_container.dart';
import '../widgets/gradient_scaffold.dart';
import '../widgets/otp_input_row.dart';
import '../widgets/primary_button.dart';
import '../widgets/top_bar.dart';

class VerifyView extends GetView<OtpController> {
  const VerifyView({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.verifyTitle, style: AppTextStyles.titleLarge),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(AppStrings.verifyBody, style: AppTextStyles.body),
                  const SizedBox(height: AppDimens.spacing20),
                  Obx(
                    () => OtpInputRow(
                      length: controller.otpLength,
                      values: controller.otpValues,
                      onChanged: (entry) =>
                          controller.setDigit(entry.key, entry.value),
                      showError: controller.showError.value,
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  Obx(
                    () => Align(
                      alignment: Alignment.centerRight,
                      child: controller.showError.value
                          ? Text(
                              AppStrings.wrongCode,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.error,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacing20),
                  Obx(
                    () => PrimaryButton(
                      label: AppStrings.verifyAction,
                      onPressed: controller.onVerify,
                      isEnabled: controller.canSubmit.value,
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  Center(
                    child: Obx(
                      () => GestureDetector(
                        onTap: controller.onResend,
                        child: Text(
                          '${controller.timerLabel.value} - ${AppStrings.resendCode}',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: controller.showError.value
                                ? AppColors.primary
                                : AppColors.success,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
