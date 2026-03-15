import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/routes/bottom_nav.dart';
import 'package:make_it_happen/app/widgets/fade_scale_in.dart';
import 'package:make_it_happen/app/widgets/floating_svg.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/profile_bottom_nav.dart';

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
