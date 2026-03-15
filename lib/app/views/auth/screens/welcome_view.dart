import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/controllers/auth/welcome_controller.dart';
import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_strings.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/bottom_sheet_container.dart';
import 'package:make_it_happen/app/widgets/fade_scale_in.dart';
import 'package:make_it_happen/app/widgets/floating_svg.dart';
import 'package:make_it_happen/app/widgets/gradient_scaffold.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/secondary_button.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      padding: EdgeInsets.zero,
      child: BottomSheetContainer(
        minHeightFactor: 0.60,
        maxHeightFactor: 0.85,
        initialHeightFactor: 0.72,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeScaleIn(
              delay: const Duration(milliseconds: 80),
              child: Text(
                AppStrings.guidedTitle,
                style: AppTextStyles.titleLarge,
              ),
            ),
            const SizedBox(height: AppDimens.spacing8),
            FadeScaleIn(
              delay: const Duration(milliseconds: 140),
              child: Text(AppStrings.guidedBody, style: AppTextStyles.body),
            ),
            const SizedBox(height: AppDimens.spacing20),
            FadeScaleIn(
              delay: const Duration(milliseconds: 220),
              child: Center(
                child: FloatingSvg(
                  assetPath: AppAssets.guidedSvg,
                  height: AppDimens.illustrationHeight,
                ),
              ),
            ),
            const SizedBox(height: AppDimens.spacing24),
            FadeScaleIn(
              delay: const Duration(milliseconds: 320),
              child: PrimaryButton(
                label: AppStrings.login,
                onPressed: controller.onLogin,
                isEnabled: true,
              ),
            ),
            const SizedBox(height: AppDimens.spacing12),
            FadeScaleIn(
              delay: const Duration(milliseconds: 380),
              child: SecondaryButton(
                label: AppStrings.createAccount,
                onPressed: controller.onCreateAccount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


