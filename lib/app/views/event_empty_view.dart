import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../routes/bottom_nav.dart';
import '../widgets/fade_scale_in.dart';
import '../widgets/floating_svg.dart';
import '../widgets/primary_button.dart';
import '../widgets/profile_bottom_nav.dart';

class EventEmptyView extends StatelessWidget {
  const EventEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            FadeScaleIn(
              delay: const Duration(milliseconds: 120),
              child: Center(
                child: FloatingSvg(
                  assetPath: AppAssets.eventPathSvg,
                  height: 240,
                ),
              ),
            ),
            // SvgPicture.asset(
            //   AppAssets.eventPathSvg,
            //   height: 240,
            // ),
            const SizedBox(height: AppDimens.spacing16),
            Text('No Events Available', style: AppTextStyles.titleLarge),
            const SizedBox(height: AppDimens.spacing8),
            Text(
              'There are currently no events scheduled in your\nlocation.',
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppDimens.spacing24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.screenPadding,
              ),
              child: PrimaryButton(
                label: 'Back To Home',
                isEnabled: true,
                onPressed: () => Get.offNamed(AppRoutes.home),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: ProfileBottomNav(
        currentIndex: BottomNav.eventsIndex,
        onTap: (index) => BottomNav.onTap(
          index: index,
          currentRoute: AppRoutes.eventEmpty,
          matchRoute: AppRoutes.matchSuggestionsBlocked,
          eventsRoute: AppRoutes.eventEmpty,
        ),
      ),
    );
  }
}
