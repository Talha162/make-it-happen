import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class AppDropdownField extends StatelessWidget {
  final String label;
  final String hintText;
  final List<String> items;
  final String value;
  final ValueChanged<String?> onChanged;

  const AppDropdownField({
    super.key,
    required this.label,
    required this.hintText,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: AppDimens.spacing8),
        SizedBox(
          height: AppDimens.fieldHeight,
          child: DropdownButtonFormField<String>(
            value: value.isEmpty ? null : value,
            onChanged: onChanged,
            icon: const Icon(LucideIcons.chevronDown, color: AppColors.textSecondary),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.fieldFill,
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
            ),
            hint: Text(hintText, style: AppTextStyles.bodyMuted),
            dropdownColor: AppColors.surface,
            style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
            items: items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: AppTextStyles.body),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
