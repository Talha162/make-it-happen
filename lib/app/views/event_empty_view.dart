import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/fade_scale_in.dart';
import '../widgets/floating_svg.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';
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
              style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppDimens.spacing24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
              child: PrimaryButton(
                label: 'Back To Home',
                isEnabled: true,
                onPressed: () => Get.toNamed(AppRoutes.profile),
              ),
            ),
            const SizedBox(height: AppDimens.spacing12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
              child: SecondaryButton(
                label: 'View Events',
                onPressed: () => Get.toNamed(AppRoutes.events),
              ),
            ),
            const Spacer(),
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

