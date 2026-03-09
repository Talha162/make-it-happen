import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
    required this.title,
    this.trailingText,
    this.onTrailingTap,
    this.compact = false,
  });

  final String title;
  final String? trailingText;
  final VoidCallback? onTrailingTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.appBarHeight,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset(
              AppAssets.backButton,
              width: 22,
              height: 22,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: AppDimens.spacing8),
          if (!compact)
            Expanded(
              child: Text(title, style: AppTextStyles.titleLarge),
            )
          else
            const Spacer(),
          if (trailingText != null)
            GestureDetector(
              onTap: onTrailingTap,
              child: Text(
                trailingText!,
                style: AppTextStyles.body.copyWith(color: AppColors.primary),
              ),
            ),
        ],
      ),
    );
  }
}
