import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/widgets/learn_detail_sections.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';

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
    final hasProgress = progress > 0;

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const LearnDetailHeroHeader(
            imagePath: AppAssets.definingRelationshipImage,
            showPlayButton: true,
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
                Text('Defining Relationships', style: AppTextStyles.titleLarge),
                const SizedBox(height: AppDimens.spacing6),
                Text(
                  'Intentional relationships start with clear\npurpose, values, and direction, not impulse.',
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
                      Text('$progressPercent%', style: AppTextStyles.bodySmall),
                    ],
                  ),
                ],
                const SizedBox(height: AppDimens.spacing16),
                Text('Status', style: AppTextStyles.label),
                const SizedBox(height: AppDimens.spacing8),
                LearnDetailStatusPill(label: statusLabel),
                const SizedBox(height: AppDimens.spacing16),
                Text('Reflect', style: AppTextStyles.titleMedium),
                const SizedBox(height: AppDimens.spacing6),
                Text(
                  'Take a moment to consider what intention means\nto you when entering a relationship.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 2),
                Text('Guided Teaching', style: AppTextStyles.body),
                const SizedBox(height: AppDimens.spacing16),
                Text('Key Takeaways', style: AppTextStyles.titleMedium),
                const SizedBox(height: AppDimens.spacing6),
                const LearnDetailBullet(
                  text: 'Intentional relationships are purpose-driven',
                ),
                const LearnDetailBullet(
                  text: 'Clarity reduces misunderstanding and\nconflict',
                ),
                const LearnDetailBullet(
                  text: 'Commitment begins before connection',
                ),
                const SizedBox(height: 2),
                Text('Guided Teaching', style: AppTextStyles.body),
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
                  LearnCompletionNotice(text: completionLabel!),
                const SizedBox(height: AppDimens.spacing20),
                PrimaryButton(
                  label: actionLabel,
                  isEnabled: true,
                  onPressed: () => Get.toNamed(
                    AppRoutes.learnLessonAction,
                    arguments: {
                      'actionLabel': actionLabel,
                      'lessonTitle': 'Defining Relationships',
                      'duration': '4 minutes',
                      'imagePath': AppAssets.definingRelationshipImage,
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
