import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/fade_scale_in.dart';
import 'package:make_it_happen/app/widgets/floating_svg.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';

class MatchCongratulationsView extends StatelessWidget {
  const MatchCongratulationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back, color: AppColors.white),
              ),
            ),
            const Spacer(),
            FadeScaleIn(
              delay: const Duration(milliseconds: 120),
              child: FloatingSvg(
                assetPath: AppAssets.congratulationsSvg,
                height: 240,
              ),
            ),
            const SizedBox(height: AppDimens.spacing20),
            Text('Congratulations', style: AppTextStyles.titleLarge),
            const SizedBox(height: AppDimens.spacing8),
            Text(
              "We're honored to have been part of your journey.\nWishing you both a meaningful and blessed\nfuture together.",
              textAlign: TextAlign.center,
              style: AppTextStyles.body,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.screenPadding,
              ),
              child: PrimaryButton(
                label: 'Continue',
                isEnabled: true,
                onPressed: () => Get.back(),
              ),
            ),
            const SizedBox(height: AppDimens.spacing24),
          ],
        ),
      ),
    );
  }
}
