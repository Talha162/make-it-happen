import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../routes/bottom_nav.dart';
import '../widgets/profile_bottom_nav.dart';

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  final List<String> _filters = ['Upcoming', 'This Month', 'Near Me', 'Hangouts'];
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    final events = [
      _EventItem(
        title: 'Community Hangout',
        date: 'Jun 14',
        schedule: 'Saturday, 8:00 AM - 6:00 PM',
        location: 'Yosemite National Park',
        price: '\$100',
        imagePath: AppAssets.communityHangoutImage,
      ),
      _EventItem(
        title: 'Guided Group Session',
        date: 'Jul 02',
        schedule: 'Wednesday, 10:00 AM - 12:00 PM',
        location: 'Riverside Center',
        price: '\$30',
        imagePath: AppAssets.guidedGroupSessionImage,
      ),
      _EventItem(
        title: 'Ministry Teaching Night',
        date: 'Jul 18',
        schedule: 'Friday, 7:00 PM - 9:00 PM',
        location: 'Downtown Theater',
        price: '\$10',
        imagePath: AppAssets.ministryTeachingNightImage,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.transparent,
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
                    label: _filters[index],
                    isSelected: index == _selectedFilterIndex,
                    onTap: () => setState(() => _selectedFilterIndex = index),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: AppDimens.spacing10),
                itemCount: _filters.length,
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
        currentIndex: BottomNav.eventsIndex,
        onTap: (index) => BottomNav.onTap(
          index: index,
          currentRoute: AppRoutes.events,
          matchRoute: AppRoutes.matchSuggestionsBlocked,
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceElevated : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryDark : AppColors.eventTagBorder,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _EventItem {
  _EventItem({
    required this.title,
    required this.date,
    required this.schedule,
    required this.location,
    required this.price,
    required this.imagePath,
  });

  final String title;
  final String date;
  final String schedule;
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.cardRadius),
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
                width: 58,
                height: 58,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: AppDimens.spacing12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: AppTextStyles.titleMedium.copyWith(fontSize: 15)),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    item.date,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.schedule,
                    style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.location,
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
