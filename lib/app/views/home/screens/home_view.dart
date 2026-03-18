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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
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
                  splashRadius: 20,
                  icon: const Icon(
                    LucideIcons.bell,
                    size: 22,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.spacing8),
            const _GuidedJourneyBanner(),
            const SizedBox(height: AppDimens.spacing24),
            const _SectionTitle(title: 'Top Matches For You'),
            const SizedBox(height: AppDimens.spacing14),
            _MatchCard(
              imagePath: AppAssets.martinKImage,
              name: 'Martin K.',
              subtitle:
                  'Preparing for marriage, Serious\nrelationship with guidance',
              age: '21 years',
              location: 'California, US',
              onMatchTap: () => Get.toNamed(AppRoutes.matchDetailAvailable),
            ),
            const SizedBox(height: AppDimens.spacing18),
            _MatchCard(
              imagePath: AppAssets.danielRImage,
              name: 'Daniel R.',
              subtitle: 'Focused on career, Open to relationships\nwith depth',
              age: '30 years',
              location: 'Texas, US',
              onMatchTap: () => Get.toNamed(AppRoutes.matchDetailAvailable),
            ),
            const SizedBox(height: AppDimens.spacing24),
            const _SectionTitle(title: 'Upcoming Events'),
            const SizedBox(height: AppDimens.spacing14),
            _EventCard(
              imagePath: AppAssets.communityHangoutImage,
              title: 'Community Hangout',
              details: 'Sat, Oct 26 - 1:00 PM - Greenfield\nFarm',
              price: '\$15',
              onTap: () => Get.toNamed(AppRoutes.eventDetail),
            ),
            const SizedBox(height: AppDimens.spacing14),
            _EventCard(
              imagePath: AppAssets.guidedGroupSessionImage,
              title: 'Guided Group Session',
              details: 'Sun, Nov 3 - 9:00 AM - Riverside\nCenter',
              price: '\$30',
              onTap: () => Get.toNamed(AppRoutes.eventDetail),
            ),
            const SizedBox(height: AppDimens.spacing14),
            _EventCard(
              imagePath: AppAssets.ministryTeachingNightImage,
              title: 'Ministry Teaching Night',
              details: 'Sat, Nov 10 - 7:00 PM - Downtown\nTheater',
              price: '\$10',
              onTap: () => Get.toNamed(AppRoutes.eventDetail),
            ),
            const SizedBox(height: AppDimens.spacing24),
            const _SectionTitle(title: 'Interviews'),
            const SizedBox(height: AppDimens.spacing14),
            _InterviewCard(
              title: 'Effective Conflict Resolution',
              duration: 'Duration: 04:15s',
              onTap: () => Get.toNamed(AppRoutes.learnVideoNotStarted),
            ),
            const SizedBox(height: AppDimens.spacing14),
            _InterviewCard(
              title: 'Building Trust and Intimacy',
              duration: 'Duration: 02:48s',
              onTap: () => Get.toNamed(AppRoutes.learnVideoInProgress),
            ),
            const SizedBox(height: AppDimens.spacing14),
            _InterviewCard(
              title: 'Healthy Communication in Marriage',
              duration: 'Duration: 03:23s',
              onTap: () => Get.toNamed(AppRoutes.learnVideoCompleted),
            ),
            const SizedBox(height: AppDimens.spacing24),
            const _SectionTitle(title: 'Pricing Plans'),
            const SizedBox(height: AppDimens.spacing14),
            _PricingCard(
              title: 'Starter',
              subtitle: 'Access matchmaking, learning content, mentorship...',
              price: '\$29.99/Month',
              startDate: '23 Jan, 2025',
              endDate: '24 Feb, 2025',
              onTap: () => Get.toNamed(AppRoutes.activePlan),
            ),
            const SizedBox(height: AppDimens.spacing14),
            _PricingCard(
              title: 'Guided',
              subtitle:
                  'Includes all features of Plan 3 plus exclusive worksh...',
              price: '\$39.99/Month',
              startDate: '01 Feb, 2025',
              endDate: '01 Mar, 2025',
              onTap: () => Get.toNamed(AppRoutes.activePlan),
            ),
            const SizedBox(height: AppDimens.spacing14),
            _PricingCard(
              title: 'Community Supporter',
              subtitle:
                  'All benefits of Plan 4 with additional one-on-one coa...',
              price: '\$49.99/Month',
              startDate: '15 Feb, 2025',
              endDate: '15 Mar, 2025',
              onTap: () => Get.toNamed(AppRoutes.activePlan),
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

class _GuidedJourneyBanner extends StatelessWidget {
  const _GuidedJourneyBanner();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.matchSuggestionsBlocked),
      child: Container(
        height: 176,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF7A3CFF), Color(0xFF157DFF)],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              Positioned(
                left: 16,
                top: 14,
                bottom: 14,
                child: SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Guided Journey',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Text(
                        'Learn, connect, and grow with\nintention through structured\nsupport.',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.white.withOpacity(0.94),
                            height: 1.2,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View Matches',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                LucideIcons.users,
                                size: 14,
                                color: AppColors.accent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: -26,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 250,
                  child: Image.asset(
                    AppAssets.yourGuidedJourneyImage,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.titleLarge.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _MatchCard extends StatelessWidget {
  const _MatchCard({
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.age,
    required this.location,
    required this.onMatchTap,
  });

  final String imagePath;
  final String name;
  final String subtitle;
  final String age;
  final String location;
  final VoidCallback onMatchTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF363636)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 46,
                  height: 46,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white.withOpacity(0.82),
                        height: 1.22,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _InfoRow(
                  icon: LucideIcons.calendar,
                  label: age,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _InfoRow(
                  icon: LucideIcons.mapPin,
                  label: location,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _PrimaryActionButton(
                  label: 'Match',
                  onTap: onMatchTap,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _SecondaryActionButton(
                  label: 'Pass',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: Icon(
            icon,
            size: 11,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class _PrimaryActionButton extends StatelessWidget {
  const _PrimaryActionButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Color(0xFF7A3CFF), Color(0xFF157DFF)],
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.button.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

class _SecondaryActionButton extends StatelessWidget {
  const _SecondaryActionButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF363636)),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.button.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  const _EventCard({
    required this.imagePath,
    required this.title,
    required this.details,
    required this.price,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final String details;
  final String price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1C),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFF363636)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      details,
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white.withOpacity(0.82),
                        height: 1.25,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                price,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InterviewCard extends StatelessWidget {
  const _InterviewCard({
    required this.title,
    required this.duration,
    required this.onTap,
  });

  final String title;
  final String duration;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1C),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFF363636)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.asset(
                  AppAssets.profileImage,
                  width: 42,
                  height: 42,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),
              Container(
                width: 26,
                height: 18,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF1515),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 16,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PricingCard extends StatelessWidget {
  const _PricingCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String price;
  final String startDate;
  final String endDate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1C),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFF363636)),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF7A3CFF), Color(0xFF157DFF)],
                      ),
                    ),
                    child: const Icon(
                      LucideIcons.dollarSign,
                      size: 16,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.titleMedium.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white.withOpacity(0.74),
                            height: 1.22,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      price,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: const Color(0xFF0D92FF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 8,
                children: [
                  Text(
                    startDate,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    endDate,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
