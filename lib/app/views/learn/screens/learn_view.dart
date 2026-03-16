import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/routes/bottom_nav.dart';
import 'package:make_it_happen/app/widgets/profile_bottom_nav.dart';

class LearnView extends StatefulWidget {
  const LearnView({super.key});

  @override
  State<LearnView> createState() => _LearnViewState();
}

class _LearnViewState extends State<LearnView> {
  final List<String> _tabs = ['All', 'Not Started', 'In Progress', 'Completed'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final lessons = [
      _LessonItem(
        image: AppAssets.understandingRelationshipImage,
        status: 'Not started',
        title: 'Understanding Intentional Relationships',
        subtitle:
            'Learn the foundations of building purposeful and accountable\nconnections.',
        type: 'Audio Lesson',
        duration: '10 minutes',
        progress: null,
        route: AppRoutes.learnVideoNotStarted,
      ),
      _LessonItem(
        image: AppAssets.preparingForMarriageImage,
        status: 'In progress',
        title: 'Preparing for Marriage Mindfully',
        subtitle: 'Readiness and self-awareness shape healthy relationships.',
        type: 'Video Lesson',
        duration: '20 minutes',
        progress: 0.1,
        route: AppRoutes.learnVideoInProgress,
      ),
      _LessonItem(
        image: AppAssets.communicationIntegrityImage,
        status: 'In progress',
        title: 'Communication with Integrity',
        subtitle: 'Explore honest communication in relationships.',
        type: 'Video Lesson',
        duration: '25 minutes',
        progress: 0.3,
        route: AppRoutes.learnVideoInProgress,
      ),
      _LessonItem(
        image: AppAssets.definingRelationshipImage,
        status: 'Completed',
        title: 'Accountability and Growth',
        subtitle: 'Explore accountability and growth in marriage.',
        type: 'Video Lesson',
        duration: '30 minutes',
        progress: 1.0,
        route: AppRoutes.learnVideoCompleted,
      ),
    ];

    final visibleLessons = switch (_selectedIndex) {
      1 => lessons.where((lesson) => lesson.status == 'Not started').toList(),
      2 => lessons.where((lesson) => lesson.status == 'In progress').toList(),
      3 => lessons.where((lesson) => lesson.status == 'Completed').toList(),
      _ => lessons,
    };

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
            _LearnTabBar(
              tabs: _tabs,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
            const SizedBox(height: AppDimens.spacing12),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.screenPadding,
                ),
                itemCount: visibleLessons.length,
                itemBuilder: (context, index) {
                  final lesson = visibleLessons[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppDimens.spacing12),
                    child: _LessonCard(
                      image: lesson.image,
                      status: lesson.status,
                      title: lesson.title,
                      subtitle: lesson.subtitle,
                      type: lesson.type,
                      duration: lesson.duration,
                      progress: lesson.progress,
                      onTap: () => Get.toNamed(lesson.route),
                    ),
                  );
                },
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
  const _LearnTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
      child: Row(
        children: [
          for (var i = 0; i < tabs.length; i++) ...[
            InkWell(
              onTap: () => onTap(i),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: i == selectedIndex
                      ? AppColors.primaryDark
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  tabs[i],
                  style: AppTextStyles.bodySmall.copyWith(
                    color: i == selectedIndex
                        ? AppColors.white
                        : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
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

class _LessonItem {
  const _LessonItem({
    required this.image,
    required this.status,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.duration,
    required this.progress,
    required this.route,
  });

  final String image;
  final String status;
  final String title;
  final String subtitle;
  final String type;
  final String duration;
  final double? progress;
  final String route;
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({
    required this.image,
    required this.status,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.duration,
    required this.progress,
    required this.onTap,
  });

  final String image;
  final String status;
  final String title;
  final String subtitle;
  final String type;
  final String duration;
  final double? progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final chipColor = status == 'Completed'
        ? const Color(0xFF9B8AD8)
        : status == 'In progress'
        ? const Color(0xFFB39AE3)
        : const Color(0xFF9B8AD8);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.spacing10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    height: 118,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: chipColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.spacing8),
            Text(title, style: AppTextStyles.titleMedium),
            const SizedBox(height: 2),
            Text(subtitle, style: AppTextStyles.body),
            const SizedBox(height: AppDimens.spacing8),
            if (progress != null)
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
                        minHeight: 5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${(progress! * 100).round()}%',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            if (progress != null) const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  type.contains('Audio')
                      ? LucideIcons.headphones
                      : LucideIcons.video,
                  size: 14,
                  color: AppColors.primaryDark,

                ),
                const SizedBox(width: 6),
                Text(type, style: AppTextStyles.body),
                const Spacer(),
                const Icon(
                  LucideIcons.clock,
                  size: 14,
                  color: AppColors.primaryDark,
                ),
                const SizedBox(width: 6),
                Text(duration, style: AppTextStyles.body),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
