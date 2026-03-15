import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class AppMultilineField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const AppMultilineField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.label.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppDimens.spacing8),
        TextField(
          controller: controller,
          onChanged: onChanged,
          maxLines: 4,
          style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMuted.copyWith(
              color: AppColors.textSecondary,
            ),
            filled: true,
            fillColor: AppColors.fieldFill,
            contentPadding: const EdgeInsets.all(AppDimens.spacing16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.smallRadius),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.smallRadius),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
