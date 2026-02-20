import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/primary_button.dart';

class LearnLessonDetailView extends StatelessWidget {
  const LearnLessonDetailView({
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
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _HeroHeader(imagePath: AppAssets.definingRelationshipImage),
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
                  Text('Defining Relationships', style: AppTextStyles.titleLarge),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    'Intentional relationships start with clear\npurpose, values, and direction, not impulse.',
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
                  Text('Reflect', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    'Take a moment to consider what intention means\n to you when entering a relationship.',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Key Takeaways', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing6),
                  _Bullet(text: 'Intentional relationships are purpose-driven'),
                  _Bullet(text: 'Clarity reduces misunderstanding and\nconflict'),
                  _Bullet(text: 'Commitment begins before connection'),
                  const SizedBox(height: AppDimens.spacing12),
                  Text('Format', style: AppTextStyles.label),
                  const SizedBox(height: 4),
                  Text('Video', style: AppTextStyles.body),
                  const SizedBox(height: AppDimens.spacing12),
                  Text('Duration', style: AppTextStyles.label),
                  const SizedBox(height: 4),
                  Text('4 minutes', style: AppTextStyles.body),
                  const SizedBox(height: AppDimens.spacing16),
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
                          Expanded(
                            child: Text(completionLabel!, style: AppTextStyles.bodySmall),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: AppDimens.spacing20),
                  PrimaryButton(
                    label: actionLabel,
                    isEnabled: true,
                    onPressed: () => Get.toNamed(AppRoutes.learnVideoInProgress),
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
          const Center(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0x66000000),
              child: Icon(Icons.play_arrow, color: AppColors.white, size: 20),
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
