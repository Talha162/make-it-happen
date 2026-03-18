import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/profile_app_bar.dart';
import 'package:make_it_happen/app/widgets/secondary_button.dart';

class LearnLessonActionView extends StatelessWidget {
  const LearnLessonActionView({super.key});

  @override
  Widget build(BuildContext context) {
    final flow = LearnLessonActionFlow.fromArguments(Get.arguments);

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.screenPadding,
                vertical: AppDimens.spacing12,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - (AppDimens.spacing12 * 2),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileAppBar(
                          title: 'Lesson Progress', compact: true),
                      const SizedBox(height: AppDimens.spacing28),
                      Center(
                        child: Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x33068EFF),
                                blurRadius: 28,
                                offset: Offset(0, 14),
                              ),
                            ],
                          ),
                          child: const Icon(
                            LucideIcons.badgeCheck,
                            color: AppColors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing20),
                      Center(
                        child: Text(
                          flow.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.titleLarge,
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing10),
                      Center(
                        child: Text(
                          flow.message,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body,
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing24),
                      Container(
                        padding: const EdgeInsets.all(AppDimens.spacing16),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                flow.imagePath,
                                width: 72,
                                height: 72,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: AppDimens.spacing12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    flow.lessonTitle,
                                    style: AppTextStyles.titleMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    flow.supportingText,
                                    style: AppTextStyles.bodySmall,
                                  ),
                                  const SizedBox(height: AppDimens.spacing10),
                                  Wrap(
                                    spacing: AppDimens.spacing12,
                                    runSpacing: 8,
                                    children: [
                                      _MetaChip(
                                        icon: LucideIcons.clock3,
                                        label: flow.duration,
                                      ),
                                      _MetaChip(
                                        icon: LucideIcons.barChart3,
                                        label: flow.progressLabel,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing16),
                      Container(
                        padding: const EdgeInsets.all(AppDimens.spacing14),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              LucideIcons.sparkles,
                              size: 16,
                              color: AppColors.accent,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                flow.tip,
                                style: AppTextStyles.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(height: AppDimens.spacing24),
                      SecondaryButton(
                        label: 'Return to Lesson',
                        onPressed: () => Get.back(),
                      ),
                      const SizedBox(height: AppDimens.spacing12),
                      PrimaryButton(
                        label: 'Back to Learn',
                        isEnabled: true,
                        onPressed: () =>
                            Get.offNamedUntil(
                                AppRoutes.learn, (route) => false),
                      ),
                      const SizedBox(height: AppDimens.spacing12),
                    ],
                  ),
                ),
              ),
            );
          } ),
        ),
      )    ;
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: AppColors.primaryDark,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
}

class LearnLessonActionFlow {
  const LearnLessonActionFlow({
    required this.title,
    required this.message,
    required this.lessonTitle,
    required this.supportingText,
    required this.duration,
    required this.progressLabel,
    required this.tip,
    required this.imagePath,
  });

  final String title;
  final String message;
  final String lessonTitle;
  final String supportingText;
  final String duration;
  final String progressLabel;
  final String tip;
  final String imagePath;

  factory LearnLessonActionFlow.fromArguments(dynamic arguments) {
    final data = arguments is Map ? arguments : const <String, dynamic>{};
    final actionLabel = (data['actionLabel'] as String?) ?? 'Start Lesson';
    final lessonTitle =
        (data['lessonTitle'] as String?) ??
        'Understanding Intentional Relationships';
    final duration = (data['duration'] as String?) ?? '10 minutes';
    final imagePath =
        (data['imagePath'] as String?) ??
        AppAssets.understandingRelationshipImage;

    switch (actionLabel) {
      case 'Resume Lesson':
        return LearnLessonActionFlow(
          title: 'Lesson Resumed',
          message:
              'You are back in the flow. Pick up where you left off and keep your momentum steady.',
          lessonTitle: lessonTitle,
          supportingText:
              'Your last checkpoint is ready, so you can continue without losing progress.',
          duration: duration,
          progressLabel: 'Resume checkpoint ready',
          tip:
              'A quick review of the previous section will make the next part feel smoother.',
          imagePath: imagePath,
        );
      case 'Continue Learning':
        return LearnLessonActionFlow(
          title: 'Learning Continued',
          message:
              'This lesson is complete, and you are ready to move forward with the next part of your learning path.',
          lessonTitle: lessonTitle,
          supportingText:
              'Your completion has been captured. Continue building consistency across the rest of the module.',
          duration: duration,
          progressLabel: 'Completed and ready for next',
          tip:
              'The strongest learning flow is to review one takeaway now and then open your next lesson while it is fresh.',
          imagePath: imagePath,
        );
      default:
        return LearnLessonActionFlow(
          title: 'Lesson Started',
          message:
              'Your lesson has started. You now have an active learning session in progress.',
          lessonTitle: lessonTitle,
          supportingText:
              'You can return to this lesson anytime and your progress will stay connected to this module.',
          duration: duration,
          progressLabel: 'In progress',
          tip:
              'Spend the first minute identifying one insight you want to carry into the rest of the lesson.',
          imagePath: imagePath,
        );
    }
  }
}
