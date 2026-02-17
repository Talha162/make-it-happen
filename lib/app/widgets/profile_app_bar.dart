import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LucideIcons.chevronLeft, color: AppColors.white),
          ),
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
