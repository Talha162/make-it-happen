import 'package:flutter/material.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import 'primary_button.dart';
import 'secondary_button.dart';

class MatchProfileCard extends StatelessWidget {
  const MatchProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.age,
    required this.location,
    this.primaryLabel = 'View Profile',
    this.secondaryLabel,
    this.onPrimaryTap,
    this.onSecondaryTap,
  });

  final String imagePath;
  final String name;
  final String subtitle;
  final String age;
  final String location;
  final String primaryLabel;
  final String? secondaryLabel;
  final VoidCallback? onPrimaryTap;
  final VoidCallback? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: AppDimens.spacing10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacing10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _InfoPill(assetPath: AppAssets.calendarIcon, label: age),
              const SizedBox(width: AppDimens.spacing8),
              _InfoPill(assetPath: AppAssets.locationIcon, label: location),
            ],
          ),
          const SizedBox(height: AppDimens.spacing12),
          if (secondaryLabel == null)
            PrimaryButton(
              label: primaryLabel,
              isEnabled: true,
              onPressed: onPrimaryTap,
            )
          else
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    label: primaryLabel,
                    isEnabled: true,
                    onPressed: onPrimaryTap,
                  ),
                ),
                const SizedBox(width: AppDimens.spacing10),
                Expanded(
                  child: SecondaryButton(
                    label: secondaryLabel!,
                    onPressed: onSecondaryTap,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({required this.assetPath, required this.label});

  final String assetPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.textPrimary,
            ),
            child: Center(
              child: Image.asset(
                assetPath,
                width: 10,
                height: 10,
                fit: BoxFit.contain,
                color: AppColors.primaryDark,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
