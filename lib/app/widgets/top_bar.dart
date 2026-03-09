import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';

class TopBar extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onSkip;
  final bool showSkip;

  const TopBar({
    super.key,
    this.onBack,
    this.onSkip,
    this.showSkip = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.appBarHeight,
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
          ),
          const Spacer(),
          if (showSkip)
            TextButton(
              onPressed: onSkip,
              child: Text(
                AppStrings.skip,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
