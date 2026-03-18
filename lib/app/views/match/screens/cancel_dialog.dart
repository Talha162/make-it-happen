import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_dimens.dart';
import '../../../resources/app_text_styles.dart';
import '../../../widgets/secondary_button.dart';

class CancelDialog {
  static void show({
    required BuildContext context,
    VoidCallback? onConfirm,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: AppDimens.screenPadding,
        ),
        child: Container(
          padding: const EdgeInsets.all(AppDimens.spacing16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.block,
                      color: AppColors.error,
                      size: 18,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close, color: AppColors.textMuted),
                  ),
                ],
              ),

              const SizedBox(height: AppDimens.spacing8),

              Text(
                'Cancel Match?',
                style: AppTextStyles.titleMedium.copyWith(
                  fontFamily: 'GeneralSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.2,
                  decoration: TextDecoration.none,
                ),
              ),

              const SizedBox(height: AppDimens.spacing6),

              Text(
                'Are you sure you want to cancel this match? Once you cancel this match you will be able to see new suggestions.',
                style: AppTextStyles.body.copyWith(
                  fontFamily: 'GeneralSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.4,
                  decoration: TextDecoration.none,
                ),
              ),

              const SizedBox(height: AppDimens.spacing16),

              SizedBox(
                width: double.infinity,
                height: AppDimens.buttonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3B3B),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimens.buttonRadius,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                    if (onConfirm != null) onConfirm();
                  },
                  child: Text(
                    'Yes, Cancel Match',
                    style: AppTextStyles.button.copyWith(
                      fontFamily: 'GeneralSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.2,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppDimens.spacing10),

              SecondaryButton(
                label: 'Close',
                onPressed: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}