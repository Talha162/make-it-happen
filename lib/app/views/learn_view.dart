import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../routes/bottom_nav.dart';
import '../widgets/profile_bottom_nav.dart';

class LearnView extends StatelessWidget {
  const LearnView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['All', 'Not Started', 'In Progress', 'Completed'];
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                AppDimens.spacing12,
                AppDimens.screenPadding,
                AppDimens.spacing6,
              ),
              child: Text('Learn', style: AppTextStyles.titleLarge),
            ),
            _LearnTabBar(tabs: tabs, selectedIndex: 0),
            const SizedBox(height: AppDimens.spacing12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
                children: [
                  _LessonCard(
                    image: AppAssets.understandingRelationshipImage,
                    status: 'Not started',
                    statusColor: const Color(0xFF2C2C2C),
                    title: 'Understanding Intentional Relationships',
                    subtitle:
                        'Learn the foundations of building purposeful and accountable\nconnections.',
                    type: 'Audio Lesson',
                    duration: '10 minutes',
                    progress: null,
                    onTap: () => Get.toNamed(AppRoutes.learnDetailNotStarted),
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  _LessonCard(
                    image: AppAssets.preparingForMarriageImage,
                    status: 'In progress',
                    statusColor: const Color(0xFF2D2D2D),
                    title: 'Preparing for Marriage Mindfully',
                    subtitle: 'Readiness and self-awareness shape healthy relationships.',
                    type: 'Video Lesson',
                    duration: '20 minutes',
                    progress: 0.1,
                    onTap: () => Get.toNamed(AppRoutes.learnDetailInProgress),
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  _LessonCard(
                    image: AppAssets.communicationIntegrityImage,
                    status: 'In progress',
                    statusColor: const Color(0xFF2D2D2D),
                    title: 'Communication with Integrity',
                    subtitle: 'Explore honest communication in relationships.',
                    type: 'Video Lesson',
                    duration: '25 minutes',
                    progress: 0.3,
                    onTap: () => Get.toNamed(AppRoutes.learnDetailInProgress),
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  _LessonCard(
                    image: AppAssets.definingRelationshipImage,
                    status: 'Completed',
                    statusColor: const Color(0xFF36234B),
                    title: 'Accountability and Growth',
                    subtitle: 'Explore accountability and growth in marriage.',
                    type: 'Video Lesson',
                    duration: '30 minutes',
                    progress: 1.0,
                    onTap: () => Get.toNamed(AppRoutes.learnDetailCompleted),
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ProfileBottomNav(
        currentIndex: BottomNav.learnIndex,
        onTap: (index) => BottomNav.onTap(
          index: index,
          currentRoute: AppRoutes.learn,
          matchRoute: AppRoutes.matchSuggestionsBlocked,
          eventsRoute: AppRoutes.eventEmpty,
        ),
      ),
    );
  }
}

class _LearnTabBar extends StatelessWidget {
  const _LearnTabBar({required this.tabs, required this.selectedIndex});

  final List<String> tabs;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
      child: Row(
        children: [
          for (var i = 0; i < tabs.length; i++) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: i == selectedIndex ? AppColors.primaryDark : AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(
                tabs[i],
                style: AppTextStyles.bodySmall.copyWith(
                  color: i == selectedIndex ? AppColors.white : AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (i != tabs.length - 1) const SizedBox(width: AppDimens.spacing8),
          ],
        ],
      ),
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({
    required this.image,
    required this.status,
    required this.statusColor,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.duration,
    required this.progress,
    required this.onTap,
  });

  final String image;
  final String status;
  final Color statusColor;
  final String title;
  final String subtitle;
  final String type;
  final String duration;
  final double? progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.spacing12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: AppDimens.spacing8),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(status, style: AppTextStyles.bodySmall.copyWith(color: AppColors.white)),
              ),
            ),
            const SizedBox(height: AppDimens.spacing6),
            Text(title, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 4),
            Text(subtitle, style: AppTextStyles.bodySmall),
            const SizedBox(height: AppDimens.spacing8),
            if (progress != null && progress! > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: AppColors.surfaceElevated,
                      valueColor: const AlwaysStoppedAnimation(AppColors.primaryDark),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            Row(
              children: [
                const Icon(LucideIcons.headphones, size: 14, color: AppColors.primaryDark),
                const SizedBox(width: 6),
                Text(type, style: AppTextStyles.bodySmall),
                const Spacer(),
                const Icon(LucideIcons.clock, size: 14, color: AppColors.primaryDark),
                const SizedBox(width: 6),
                Text(duration, style: AppTextStyles.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

