import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class HomeNotificationsView extends StatelessWidget {
  const HomeNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NotificationItem(
        title: 'Match Accepted',
        body: 'Your match has been accepted and is now...',
      ),
      _NotificationItem(
        title: 'Match Declined',
        body: 'The match request was not accepted.',
      ),
      _NotificationItem(
        title: 'Match Cancelled',
        body: 'Your match has been cancelled and feedback...',
      ),
      _NotificationItem(
        title: 'Profile Status Update',
        body: 'Your profile status has changed based on y...',
      ),
      _NotificationItem(
        title: 'New Course Available',
        body: 'A new course has been added to support y...',
      ),
      _NotificationItem(
        title: 'Course Update',
        body: 'New lessons have been added to a course...',
      ),
      _NotificationItem(
        title: 'Mentorship Assigned',
        body: 'A mentor has been assigned to support yo...',
      ),
      _NotificationItem(
        title: 'Mentorship Invitation',
        body: "You've been invited to join a mentorship se...",
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
            ),
            const SizedBox(height: AppDimens.spacing6),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.screenPadding,
              ),
              child: Text('Notifications', style: AppTextStyles.titleLarge),
            ),
            const SizedBox(height: AppDimens.spacing12),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.screenPadding,
                ),
                itemCount: items.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(height: AppDimens.spacing10),
                itemBuilder: (context, index) =>
                    _NotificationTile(item: items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationItem {
  _NotificationItem({required this.title, required this.body});

  final String title;
  final String body;
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: const BoxDecoration(
              color: AppColors.transparent,
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(color: AppColors.border),
              ),
            ),
            child: const Icon(
              LucideIcons.bell,
              color: AppColors.primaryDark,
              size: 18,
            ),
          ),
          const SizedBox(width: AppDimens.spacing10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(item.body, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

