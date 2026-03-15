import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.buttonHeight,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
          gradient: const LinearGradient(
            colors: [AppColors.accent, AppColors.primaryDark],
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
            ),
          ),
          child: Text(label, style: AppTextStyles.button),
        ),
      ),
    );
  }
}
