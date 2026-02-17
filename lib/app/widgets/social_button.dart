import 'package:flutter/material.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const SocialButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.buttonHeight,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
            side: const BorderSide(color: AppColors.border),
          ),
          backgroundColor: AppColors.surfaceElevated,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.googleLogo,
              width: AppDimens.iconSize,
              height: AppDimens.iconSize,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.g_mobiledata,
                color: AppColors.textPrimary,
                size: AppDimens.iconSize,
              ),
            ),
            const SizedBox(width: AppDimens.spacing8),
            Text(label, style: AppTextStyles.buttonDark),
          ],
        ),
      ),
    );
  }
}
