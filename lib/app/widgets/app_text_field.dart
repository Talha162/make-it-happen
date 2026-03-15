import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasLabel = label.trim().isNotEmpty;
    final hasRequiredMarker = label.endsWith(' *');
    final baseLabel = hasRequiredMarker
        ? label.substring(0, label.length - 2)
        : label;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLabel)
          Text.rich(
            TextSpan(
              style: AppTextStyles.label.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(text: baseLabel),
                if (hasRequiredMarker)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: AppColors.error),
                  ),
              ],
            ),
          ),
        if (hasLabel) const SizedBox(height: AppDimens.spacing8),
        SizedBox(
          height: AppDimens.fieldHeight,
          child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            obscureText: obscureText,
            style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.bodyMuted,
              filled: true,
              fillColor: AppColors.fieldFill,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppDimens.spacing16,
                vertical: AppDimens.spacing12,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
                borderSide: const BorderSide(color: AppColors.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
                borderSide: const BorderSide(color: AppColors.error),
              ),
              errorStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
