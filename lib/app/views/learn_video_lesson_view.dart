import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../widgets/learn_detail_sections.dart';
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
    final hasProgress = progress > 0;
    final outlineStatuses = statusLabel == 'Completed'
        ? const ['Completed', 'Completed', 'Completed']
        : const ['In Progress', 'Not Started', 'Not Started'];

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: ListView(
          padding: EdgeInsets.zero,
          children: [
            const LearnDetailHeroHeader(
              imagePath: AppAssets.understandingRelationshipImage,
              showPlayButton: false,
            ),
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
                  Text(
                    'Understanding\nIntentional Relationships',
                    style: AppTextStyles.titleLarge,
                  ),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    'Learn the foundations of building\npurposeful and accountable connections.',
                    style: AppTextStyles.body,
                  ),
                  if (hasProgress) ...[
                    const SizedBox(height: AppDimens.spacing14),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: const Color(0xFFD8EEF9),
                              valueColor: const AlwaysStoppedAnimation(
                                AppColors.primaryDark,
                              ),
                              minHeight: 6,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$progressPercent%',
                          style: AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Status', style: AppTextStyles.label),
                  const SizedBox(height: AppDimens.spacing8),
                  LearnDetailStatusPill(label: statusLabel),
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
                  Text("What You'll Learn", style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing6),
                  const LearnDetailBullet(
                    text: 'Understanding intentional relationship\nfoundations',
                  ),
                  const LearnDetailBullet(
                    text: 'Recognizing personal readiness',
                  ),
                  const LearnDetailBullet(
                    text:
                        'Approaching relationships with clarity and\nresponsibility',
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Lesson Outline', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing8),
                  _OutlineTile(
                    image: AppAssets.definingRelationshipImage,
                    title: 'Defining Relationships',
                    subtitle:
                        'Understand what it means to approach relations...',
                    status: outlineStatuses[0],
                  ),
                  const SizedBox(height: AppDimens.spacing10),
                  _OutlineTile(
                    image: AppAssets.preparingForMarriageImage,
                    title: 'Readiness and Self-Awareness',
                    subtitle:
                        'Reflect on personal readiness and the role of sel...',
                    status: outlineStatuses[1],
                  ),
                  const SizedBox(height: AppDimens.spacing10),
                  _OutlineTile(
                    image: AppAssets.communicationIntegrityImage,
                    title: 'Accountability in Connection',
                    subtitle:
                        'Learn why guidance and accountability are esse...',
                    status: outlineStatuses[2],
                  ),
                  const SizedBox(height: AppDimens.spacing14),
                  if (completionLabel != null)
                    LearnCompletionNotice(text: completionLabel!),
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
            child: Image.asset(image, width: 40, height: 40, fit: BoxFit.cover),
          ),
          const SizedBox(width: AppDimens.spacing10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTextStyles.bodySmall),
                const SizedBox(height: 8),
                LearnDetailStatusPill(label: status),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

