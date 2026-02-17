import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class SelectionChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const SelectionChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing12,
          vertical: AppDimens.spacing6,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.chipFill : AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(AppDimens.chipRadius),
          border: Border.all(
            color: selected ? AppColors.chipBorder : AppColors.border,
          ),
        ),
        child: Text(label, style: AppTextStyles.chip),
      ),
    );
  }
}
