import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/routes/bottom_nav.dart';
import 'package:make_it_happen/app/widgets/match_profile_card.dart';
import 'package:make_it_happen/app/widgets/match_tab_bar.dart';
import 'package:make_it_happen/app/widgets/profile_bottom_nav.dart';

class MatchMatchedView extends StatelessWidget {
  const MatchMatchedView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Suggestions', 'Matched', 'Requested', 'Cancelled'];
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
              child: Text('Match', style: AppTextStyles.titleLarge),
            ),
            MatchTabBar(
              tabs: tabs,
              selectedIndex: 1,
              onTap: (index) {
                if (index == 0) Get.toNamed(AppRoutes.matchSuggestions);
                if (index == 1) Get.toNamed(AppRoutes.matchMatched);
                if (index == 2) Get.toNamed(AppRoutes.matchRequested);
                if (index == 3) Get.toNamed(AppRoutes.matchCancelled);
              },
            ),
            const SizedBox(height: AppDimens.spacing16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.screenPadding,
              ),
              child: MatchProfileCard(
                imagePath: AppAssets.oliverTImage,
                name: 'Oliver T.',
                subtitle:
                    'Focused on career, Open to relationships\nwith depth',
                age: '30 years',
                location: 'Texas, US',
                primaryLabel: 'View Profile',
                onPrimaryTap: () => Get.toNamed(AppRoutes.matchDetailMatched),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ProfileBottomNav(
        currentIndex: BottomNav.matchIndex,
        onTap: (index) => BottomNav.onTap(
          index: index,
          currentRoute: AppRoutes.matchMatched,
          matchRoute: AppRoutes.matchMatched,
          eventsRoute: AppRoutes.eventEmpty,
        ),
      ),
    );
  }
}
