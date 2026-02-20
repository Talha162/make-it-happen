import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/profile_bottom_nav.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ['Upcoming', 'This Month', 'Near Me', 'Hangouts'];
    final events = [
      _EventItem(
        title: 'Community Hangout',
        date: 'Sat, Oct 26 - 1:00 PM',
        location: 'Greenfield Farm',
        price: '\$15',
        imagePath: AppAssets.communityHangoutImage,
      ),
      _EventItem(
        title: 'Guided Group Session',
        date: 'Sun, Nov 3 - 9:00 AM',
        location: 'Riverside Center',
        price: '\$30',
        imagePath: AppAssets.guidedGroupSessionImage,
      ),
      _EventItem(
        title: 'Ministry Teaching Night',
        date: 'Sat, Nov 10 - 7:00 PM',
        location: 'Downtown Theater',
        price: '\$10',
        imagePath: AppAssets.ministryTeachingNightImage,
      ),
      _EventItem(
        title: 'Weekend Camping Trip',
        date: 'Sat, Sept 28 - 8:00 AM',
        location: 'Community Grounds',
        price: '\$12',
        imagePath: AppAssets.weekendCampingImage,
      ),
      _EventItem(
        title: 'Beach Clean-Up Day',
        date: 'Sun, Oct 6 - 10:00 AM',
        location: 'Downtown Center',
        price: '\$12',
        imagePath: AppAssets.beachCleanupImage,
      ),
      _EventItem(
        title: 'City Art Festival',
        date: 'Sun, Oct 20 - 7:00 AM',
        location: 'Central Convention Hall',
        price: '\$25',
        imagePath: AppAssets.cityArtFestivalImage,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                AppDimens.spacing12,
                AppDimens.screenPadding,
                AppDimens.spacing8,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Events', style: AppTextStyles.titleLarge),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _FilterChip(
                    label: filters[index],
                    isSelected: index == 0,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: AppDimens.spacing10),
                itemCount: filters.length,
              ),
            ),
            const SizedBox(height: AppDimens.spacing16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  AppDimens.screenPadding,
                  0,
                  AppDimens.screenPadding,
                  AppDimens.spacing24,
                ),
                itemBuilder: (context, index) => _EventCard(
                  item: events[index],
                  onTap: () => Get.toNamed(AppRoutes.eventDetail),
                ),
                separatorBuilder: (_, __) => const SizedBox(height: AppDimens.spacing14),
                itemCount: events.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ProfileBottomNav(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(AppRoutes.home);
          }
          if (index == 2) {
            Get.toNamed(AppRoutes.matchSuggestionsBlocked);
          }
          if (index == 4) {
            Get.toNamed(AppRoutes.profile);
          }
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.surfaceElevated : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.eventTagBorder),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _EventItem {
  _EventItem({
    required this.title,
    required this.date,
    required this.location,
    required this.price,
    required this.imagePath,
  });

  final String title;
  final String date;
  final String location;
  final String price;
  final String imagePath;
}

class _EventCard extends StatelessWidget {
  const _EventCard({required this.item, required this.onTap});

  final _EventItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.spacing14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.cardRadius),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                item.imagePath,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: AppDimens.spacing12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyles.titleMedium.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    '${item.date} - ${item.location}',
                    style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            Text(
              item.price,
              style: AppTextStyles.titleMedium.copyWith(
                fontSize: 14,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
