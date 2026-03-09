import 'package:flutter/material.dart';

import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
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
                color: AppColors.surfaceElevated,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border),
              ),
              child: Icon(icon, size: 15, color: AppColors.primaryDark),
            ),
            const SizedBox(width: AppDimens.spacing12),
            Expanded(
              child: Text(label, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
            ),
            const Icon(LucideIcons.chevronRight, color: AppColors.textMuted, size: 18),
          ],
        ),
      ),
    );
  }
}
