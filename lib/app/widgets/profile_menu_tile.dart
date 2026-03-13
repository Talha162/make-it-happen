import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    this.icon,
    this.assetIconPath,
    this.iconBackgroundColor,
    this.iconSize = 15,
    this.assetTintColor = AppColors.white,
    required this.label,
    required this.onTap,
  }) : assert(icon != null || assetIconPath != null);

  final IconData? icon;
  final String? assetIconPath;
  final Color? iconBackgroundColor;
  final double iconSize;
  final Color assetTintColor;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconBackgroundColor,
                gradient: iconBackgroundColor == null
                    ? const LinearGradient(
                        colors: [AppColors.accent, AppColors.primaryDark],
                      )
                    : null,
              ),
              child: Center(
                child: assetIconPath != null
                    ? Image.asset(
                        assetIconPath!,
                        width: iconSize,
                        height: iconSize,
                        fit: BoxFit.contain,
                        color: assetTintColor,
                        colorBlendMode: BlendMode.srcIn,
                      )
                    : Icon(icon, size: iconSize, color: AppColors.white),
              ),
            ),
            const SizedBox(width: AppDimens.spacing12),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
              ),
            ),
            const Icon(
              LucideIcons.chevronRight,
              color: AppColors.textMuted,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
