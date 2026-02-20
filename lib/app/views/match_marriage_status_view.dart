import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/primary_button.dart';

class MatchMarriageStatusView extends StatelessWidget {
  const MatchMarriageStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back, color: AppColors.white),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
                children: [
                  const SizedBox(height: AppDimens.spacing8),
                  Text('Gotten Married?', style: AppTextStyles.titleLarge),
                  const SizedBox(height: AppDimens.spacing20),
                  _DropdownField(
                    label: 'Marriage Status',
                    value: 'Yes, we’re married',
                  ),
                  const SizedBox(height: AppDimens.spacing14),
                  _TextField(
                    label: 'Partner Name',
                    value: 'Sarah J.',
                  ),
                  const SizedBox(height: AppDimens.spacing14),
                  _MultilineField(
                    label: 'Short Message',
                    value: 'Share your happiness with the community\n(optional)',
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Upload Photo', style: AppTextStyles.label),
                  const SizedBox(height: AppDimens.spacing10),
                  _UploadBox(),
                  const SizedBox(height: AppDimens.spacing24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                0,
                AppDimens.screenPadding,
                AppDimens.spacing24,
              ),
              child: PrimaryButton(
                label: 'Confirm Marriage',
                isEnabled: true,
                onPressed: () => Get.toNamed(AppRoutes.matchCongratulations),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  const _DropdownField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: AppDimens.spacing8),
        Container(
          height: AppDimens.fieldHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing12),
          decoration: BoxDecoration(
            color: AppColors.fieldFill,
            borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down, color: AppColors.textMuted),
            ],
          ),
        ),
      ],
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: AppDimens.spacing8),
        Container(
          height: AppDimens.fieldHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing12),
          decoration: BoxDecoration(
            color: AppColors.fieldFill,
            borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
            border: Border.all(color: AppColors.border),
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}

class _MultilineField extends StatelessWidget {
  const _MultilineField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: AppDimens.spacing8),
        Container(
          height: 96,
          padding: const EdgeInsets.all(AppDimens.spacing12),
          decoration: BoxDecoration(
            color: AppColors.fieldFill,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(value, style: AppTextStyles.body),
        ),
      ],
    );
  }
}

class _UploadBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(LucideIcons.upload, size: 16, color: AppColors.white),
            ),
            const SizedBox(height: 6),
            Text(
              'Drop images or click to add',
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
