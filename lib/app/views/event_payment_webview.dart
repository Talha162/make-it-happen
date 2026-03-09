import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../widgets/primary_button.dart';

class EventPaymentWebView extends StatelessWidget {
  const EventPaymentWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.screenPadding,
                vertical: AppDimens.spacing12,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.close, color: AppColors.white),
                  ),
                  const SizedBox(width: AppDimens.spacing6),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.spacing12,
                        vertical: AppDimens.spacing8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        'https://pay.example.com',
                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimens.spacing12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppColors.surfaceElevated,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Secure Payment Portal',
                            style: AppTextStyles.titleMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppDimens.spacing16),
                        child: Container(
                          padding: const EdgeInsets.all(AppDimens.spacing16),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceElevated,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total', style: AppTextStyles.bodySmall),
                              const SizedBox(height: 6),
                              Text(
                                '\$100',
                                style: AppTextStyles.titleLarge.copyWith(color: AppColors.textPrimary),
                              ),
                              const SizedBox(height: AppDimens.spacing12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: AppColors.border,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text('•••• 4242', style: AppTextStyles.bodySmall),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                AppDimens.spacing12,
                AppDimens.screenPadding,
                AppDimens.spacing24,
              ),
              child: PrimaryButton(
                label: 'Complete Payment',
                isEnabled: true,
                onPressed: () => Get.back(result: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
