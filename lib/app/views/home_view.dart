import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/bottom_nav.dart';
import '../routes/app_routes.dart';
import '../widgets/match_profile_card.dart';
import '../widgets/profile_bottom_nav.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppDimens.screenPadding,
            AppDimens.spacing12,
            AppDimens.screenPadding,
            AppDimens.spacing24,
          ),
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () => Get.toNamed(AppRoutes.homeNotifications),
                  icon: const Icon(LucideIcons.bell, color: AppColors.textPrimary),
                ),
              ],
            ),
            _JourneyCard(),
            const SizedBox(height: AppDimens.spacing16),
            Text('Top Matches For You', style: AppTextStyles.titleMedium),
            const SizedBox(height: AppDimens.spacing12),
            MatchProfileCard(
              imagePath: AppAssets.martinKImage,
              name: 'Martin K.',
              subtitle: 'Preparing for marriage, Serious\nrelationship with guidance',
              age: '21 years',
              location: 'California, US',
              primaryLabel: 'Match',
              secondaryLabel: 'Pass',
              onPrimaryTap: () => Get.toNamed(AppRoutes.matchDetailAvailable),
            ),
            const SizedBox(height: AppDimens.spacing12),
            MatchProfileCard(
              imagePath: AppAssets.danielRImage,
              name: 'Daniel R.',
              subtitle: 'Focused on career, Open to relationships\nwith depth',
              age: '30 years',
              location: 'Texas, US',
              primaryLabel: 'Match',
              secondaryLabel: 'Pass',
              onPrimaryTap: () => Get.toNamed(AppRoutes.matchDetailAvailable),
            ),
            const SizedBox(height: AppDimens.spacing16),
            Text('Upcoming Events', style: AppTextStyles.titleMedium),
            const SizedBox(height: AppDimens.spacing12),
            _EventTile(
              image: AppAssets.communityHangoutImage,
              title: 'Community Hangout',
              time: 'Sat, Oct 26 - 1:00 PM - Greenfield\nFarm',
              price: '\$15',
            ),
            const SizedBox(height: AppDimens.spacing12),
            _EventTile(
              image: AppAssets.guidedGroupSessionImage,
              title: 'Guided Group Session',
              time: 'Sun, Nov 3 - 9:00 AM - Riverside\nCenter',
              price: '\$30',
            ),
            const SizedBox(height: AppDimens.spacing12),
            _EventTile(
              image: AppAssets.ministryTeachingNightImage,
              title: 'Ministry Teaching Night',
              time: 'Sat, Nov 10 - 7:00 PM - Downtown\nTheater',
              price: '\$10',
            ),
            const SizedBox(height: AppDimens.spacing16),
            Text('Lessons For You', style: AppTextStyles.titleMedium),
            const SizedBox(height: AppDimens.spacing12),
            _LessonCard(
              image: AppAssets.understandingRelationshipImage,
              status: 'Not started',
              title: 'Understanding Intentional Relationships',
              subtitle:
                  'Learn the foundations of building purposeful and accountable\nconnections.',
              duration: '10 minutes',
              type: 'Audio Lesson',
              progress: null,
            ),
            const SizedBox(height: AppDimens.spacing12),
            _LessonCard(
              image: AppAssets.preparingForMarriageImage,
              status: 'In progress',
              title: 'Preparing for Marriage Mindfully',
              subtitle: 'Readiness and self-awareness shape healthy relationships.',
              duration: '20 minutes',
              type: 'Video Lesson',
              progress: 0.1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ProfileBottomNav(
        currentIndex: BottomNav.homeIndex,
        onTap: (index) => BottomNav.onTap(
          index: index,
          currentRoute: AppRoutes.home,
          matchRoute: AppRoutes.matchSuggestionsBlocked,
          eventsRoute: AppRoutes.eventEmpty,
        ),
      ),
    );
  }
}

class _JourneyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [AppColors.accent, AppColors.primaryDark],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Guided Journey',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Learn, connect, and grow with\nintention through structured\nsupport.',
                      style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
                      maxLines: 3,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View Matches',
                            style: AppTextStyles.bodySmall.copyWith(color: AppColors.primaryDark),
                          ),
                          const SizedBox(width: 6),
                          const Icon(LucideIcons.users, size: 14, color: AppColors.primaryDark),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 180,
              height: double.infinity,
              child: Image.asset(
                AppAssets.yourGuidedJourneyImage,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile({
    required this.image,
    required this.title,
    required this.time,
    required this.price,
  });

  final String image;
  final String title;
  final String time;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: InkWell(
        onTap: ()=>Get.toNamed(AppRoutes.eventDetail),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(title, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text(time, style: AppTextStyles.bodySmall),
                ],
              ),
            ),
            Text(price, style: AppTextStyles.body.copyWith(color: AppColors.accent)),
          ],
        ),
      ),
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({
    required this.image,
    required this.status,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.type,
    required this.progress,
  });

  final String image;
  final String status;
  final String title;
  final String subtitle;
  final String duration;
  final String type;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: InkWell(
        onTap: () => Get.toNamed(AppRoutes.learnDetailInProgress),
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(status, style: AppTextStyles.bodySmall),
              ),
            ),
            const SizedBox(height: AppDimens.spacing6),
            Text(title, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 4),
            Text(subtitle, style: AppTextStyles.bodySmall),
            const SizedBox(height: AppDimens.spacing8),
            if (progress != null)
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

