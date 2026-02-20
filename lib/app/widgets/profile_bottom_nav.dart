import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class ProfileBottomNav extends StatelessWidget {
  const ProfileBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(label: 'Home', icon: LucideIcons.home),
      _NavItem(label: 'Learn', icon: LucideIcons.bookOpen),
      _NavItem(label: 'Match', icon: LucideIcons.users),
      _NavItem(label: 'Events', icon: LucideIcons.calendar),
      _NavItem(label: 'Profile', icon: LucideIcons.user),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.spacing12,
            vertical: AppDimens.spacing8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < items.length; i++)
                Expanded(
                  child: GestureDetector(
                    onTap: () => onTap(i),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          items[i].icon,
                          size: 20,
                          color: i == currentIndex ? AppColors.primaryDark : AppColors.textMuted,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          items[i].label,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: i == currentIndex ? AppColors.primaryDark : AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  _NavItem({required this.label, required this.icon});

  final String label;
  final IconData icon;
}
