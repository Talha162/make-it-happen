import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/routes/bottom_nav.dart';
import 'package:make_it_happen/app/utils/demo_feedback.dart';
import 'package:make_it_happen/app/widgets/match_profile_card.dart';
import 'package:make_it_happen/app/widgets/match_tab_bar.dart';
import 'package:make_it_happen/app/widgets/profile_bottom_nav.dart';

import 'cancel_dialog.dart';

class MatchRequestedView extends StatelessWidget {
  const MatchRequestedView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Suggestions', 'Matched', 'Requested', 'Cancelled'];
    final profiles = [
      _MatchItem(
        name: 'Martin K.',
        subtitle: 'Preparing for marriage, Serious\nrelationship with guidance',
        age: '21 years',
        location: 'California, US',
        image: AppAssets.martinKImage,
      ),
      _MatchItem(
        name: 'Daniel R.',
        subtitle: 'Focused on career, Open to relationships\nwith depth',
        age: '30 years',
        location: 'Texas, US',
        image: AppAssets.danielRImage,
      ),
      _MatchItem(
        name: 'Amelia S.',
        subtitle:
            'Enjoying life, Seeks adventure and\ncompanionship with right person',
        age: '24 years',
        location: 'Florida, US',
        image: AppAssets.ameliaSImage,
      ),
      _MatchItem(
        name: 'Sophia L.',
        subtitle: 'Exploring friendships, Looking for\nmeaningful connections',
        age: '27 years',
        location: 'New York, US',
        image: AppAssets.sophoaLImage,
      ),
      _MatchItem(
        name: 'Liam K.',
        subtitle: 'Guided by purpose, Interested in\nintentional marriage path',
        age: '29 years',
        location: 'Nevada, US',
        image: AppAssets.liamKImage,
      ),
    ];

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
              child: Row(
                children: [
                  Text('Match', style: AppTextStyles.titleLarge),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Get.toNamed(AppRoutes.matchSearch),
                    icon: const Icon(
                      LucideIcons.search,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            MatchTabBar(
              tabs: tabs,
              selectedIndex: 2,
              onTap: (index) {
                if (index == 0) Get.toNamed(AppRoutes.matchSuggestions);
                if (index == 1) Get.toNamed(AppRoutes.matchMatched);
                if (index == 2) Get.toNamed(AppRoutes.matchRequested);
                if (index == 3) Get.toNamed(AppRoutes.matchCancelled);
              },
            ),
            const SizedBox(height: AppDimens.spacing16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.screenPadding,
                ),
                itemCount: profiles.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppDimens.spacing12),
                itemBuilder: (context, index) {
                  final profile = profiles[index];
                  return MatchProfileCard(
                    imagePath: profile.image,
                    name: profile.name,
                    subtitle: profile.subtitle,
                    age: profile.age,
                    location: profile.location,
                    primaryLabel: 'View Profile',
                    secondaryLabel: 'Cancel Request',
                    onPrimaryTap: () =>
                        Get.toNamed(AppRoutes.matchDetailRequested),
                    onSecondaryTap: () {
                      CancelDialog.show(
                        context: context,
                        onConfirm: () {
                          showDemoAction(
                            'Request cancelled',
                            'The request was cancelled locally for this demo.',
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ProfileBottomNav(
        currentIndex: BottomNav.matchIndex,
        onTap: (index) => BottomNav.onTap(
          index: index,
          currentRoute: AppRoutes.matchRequested,
          matchRoute: AppRoutes.matchRequested,
          eventsRoute: AppRoutes.eventEmpty,
        ),
      ),
    );
  }
}

class _MatchItem {
  _MatchItem({
    required this.name,
    required this.subtitle,
    required this.age,
    required this.location,
    required this.image,
  });

  final String name;
  final String subtitle;
  final String age;
  final String location;
  final String image;
}
