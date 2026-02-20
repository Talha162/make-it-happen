import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/fade_scale_in.dart';
import '../widgets/floating_svg.dart';
import '../widgets/match_tab_bar.dart';
import '../widgets/primary_button.dart';
import '../widgets/profile_bottom_nav.dart';

class MatchSuggestionsBlockedView extends StatelessWidget {
  const MatchSuggestionsBlockedView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Suggestions', 'Matched', 'Requested', 'Cancelled'];
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
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
              selectedIndex: 0,
              onTap: (index) {
                if (index == 0) Get.toNamed(AppRoutes.matchSuggestionsBlocked);
                if (index == 1) Get.toNamed(AppRoutes.matchMatched);
                if (index == 2) Get.toNamed(AppRoutes.matchRequested);
                if (index == 3) Get.toNamed(AppRoutes.matchCancelled);
              },
            ),
            const Spacer(),
            FadeScaleIn(
              delay: const Duration(milliseconds: 120),
              child: Center(
                child: FloatingSvg(
                  assetPath: AppAssets.suggestionsSvg,
                  height: 220,
                ),
              ),
            ),
            const SizedBox(height: AppDimens.spacing16),
            Center(
              child: Text('You’re Currently Matched', style: AppTextStyles.titleLarge),
            ),
            const SizedBox(height: AppDimens.spacing8),
            Center(
              child: Text(
                'You have an active match. To stay fair, chat with\none match at a time.',
                textAlign: TextAlign.center,
                style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
              ),
            ),
            const SizedBox(height: AppDimens.spacing20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
              child: PrimaryButton(
                label: 'View Matched Profile',
                isEnabled: true,
                onPressed: () => Get.toNamed(AppRoutes.matchDetailMatched),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: ProfileBottomNav(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) Get.toNamed(AppRoutes.home);
          if (index == 2) Get.toNamed(AppRoutes.matchSuggestionsBlocked);
          if (index == 3) Get.toNamed(AppRoutes.eventEmpty);
          if (index == 4) Get.toNamed(AppRoutes.profile);
        },
      ),
    );
  }
}
