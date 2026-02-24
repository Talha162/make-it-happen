import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../widgets/primary_button.dart';

class LearnVideoLessonView extends StatelessWidget {
  const LearnVideoLessonView({
    super.key,
    required this.statusLabel,
    required this.progress,
    required this.actionLabel,
    required this.completionLabel,
  });

  final String statusLabel;
  final double progress;
  final String actionLabel;
  final String? completionLabel;

  @override
  Widget build(BuildContext context) {
    final progressPercent = (progress * 100).round();
    final statusColor = statusLabel == 'Completed'
        ? const Color(0xFF5C2D91)
        : statusLabel == 'In Progress'
            ? const Color(0xFF2C2C2C)
            : const Color(0xFF2C2C2C);

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _HeroHeader(imagePath: AppAssets.understandingRelationshipImage),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                AppDimens.spacing16,
                AppDimens.screenPadding,
                AppDimens.spacing24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Understanding\nIntentional Relationships', style: AppTextStyles.titleLarge),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    'Learn the foundations of building\npurposeful and accountable connections.',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: AppDimens.spacing14),
                  Row(
                    children: [
                      Text('Status', style: AppTextStyles.label),
                      const Spacer(),
                      Text('$progressPercent%', style: AppTextStyles.bodySmall),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: AppColors.surfaceElevated,
                      valueColor: const AlwaysStoppedAnimation(AppColors.primaryDark),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacing10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(statusLabel, style: AppTextStyles.bodySmall.copyWith(color: AppColors.white)),
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Value', style: AppTextStyles.label),
                  const SizedBox(height: 4),
                  Text('Guided Teaching', style: AppTextStyles.body),
                  const SizedBox(height: AppDimens.spacing12),
                  Text('Value', style: AppTextStyles.label),
                  const SizedBox(height: 4),
                  Text('10 minutes', style: AppTextStyles.body),
                  const SizedBox(height: AppDimens.spacing12),
                  Text('Format', style: AppTextStyles.label),
                  const SizedBox(height: 4),
                  Text('Written and Audio', style: AppTextStyles.body),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('What You’ll Learn', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing6),
                  _Bullet(text: 'Understanding intentional relationship'),
                  _Bullet(text: 'Recognizing personal readiness'),
                  _Bullet(text: 'Approaching relationships with clarity and\nresponsibility'),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Lesson Outline', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing8),
                  _OutlineTile(
                    image: AppAssets.definingRelationshipImage,
                    title: 'Defining Relationships',
                    subtitle: 'Understand what it means to approach relation...',
                    status: 'Completed',
                  ),
                  const SizedBox(height: AppDimens.spacing10),
                  _OutlineTile(
                    image: AppAssets.preparingForMarriageImage,
                    title: 'Readiness and Self‑Awareness',
                    subtitle: 'Reflect on your own readiness before...',
                    status: 'Completed',
                  ),
                  const SizedBox(height: AppDimens.spacing10),
                  _OutlineTile(
                    image: AppAssets.communicationIntegrityImage,
                    title: 'Accountability in Connection',
                    subtitle: 'Learn why accountability is essential...',
                    status: 'Completed',
                  ),
                  const SizedBox(height: AppDimens.spacing14),
                  if (completionLabel != null)
                    Container(
                      padding: const EdgeInsets.all(AppDimens.spacing12),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          const Icon(LucideIcons.checkCircle, color: AppColors.primaryDark, size: 16),
                          const SizedBox(width: 8),
                          Expanded(child: Text(completionLabel!, style: AppTextStyles.bodySmall)),
                        ],
                      ),
                    ),
                  const SizedBox(height: AppDimens.spacing20),
                  PrimaryButton(
                    label: actionLabel,
                    isEnabled: true,
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: AppColors.textPrimary)),
          Expanded(child: Text(text, style: AppTextStyles.bodySmall)),
        ],
      ),
    );
  }
}

class _OutlineTile extends StatelessWidget {
  const _OutlineTile({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  final String image;
  final String title;
  final String subtitle;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppDimens.spacing10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF2B2B2B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.primaryDark),
            ),
          ),
        ],
      ),
    );
  }
}

