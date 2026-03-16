import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/widgets/match_detail_sections.dart';
import 'package:make_it_happen/app/widgets/match_preference_chip.dart';
import 'package:make_it_happen/app/widgets/match_status_pill.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';

class MatchDetailRequestedView extends StatelessWidget {
  const MatchDetailRequestedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const MatchDetailHeroHeader(imagePath: AppAssets.martinKImage),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimens.screenPadding,
              AppDimens.spacing16,
              AppDimens.screenPadding,
              AppDimens.spacing64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Martin K.', style: AppTextStyles.titleLarge),
                const SizedBox(height: AppDimens.spacing6),
                Text(
                  'Purpose-driven and open to a guided journey\ntoward marriage.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: AppDimens.spacing16),
                const MatchDetailInfoBlock(label: 'Age', value: '28'),
                const MatchDetailInfoBlock(
                  label: 'Location',
                  value: 'Lahore, Pakistan',
                ),
                Text('Status', style: AppTextStyles.label),
                const SizedBox(height: AppDimens.spacing8),
                const MatchStatusPill(label: 'Request Pending'),
                const SizedBox(height: AppDimens.spacing16),
                Text('Key Preferences', style: AppTextStyles.titleMedium),
                const SizedBox(height: AppDimens.spacing10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    MatchPreferenceChip(label: 'Purpose-focused'),
                    MatchPreferenceChip(label: 'Open to mentorship'),
                    MatchPreferenceChip(label: 'Faith-guided growth'),
                  ],
                ),
                const SizedBox(height: AppDimens.spacing16),
                Text('Why This Match', style: AppTextStyles.titleMedium),
                const SizedBox(height: AppDimens.spacing6),
                Text(
                  'Aligned relationship intention and compatible\npreferences based on your profile.',
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(
            AppDimens.screenPadding,
            AppDimens.spacing12,
            AppDimens.screenPadding,
            AppDimens.spacing16,
          ),
          color: AppColors.screenBackground,
          child: PrimaryButton(
            label: 'Cancel Request',
            isEnabled: true,
            onPressed: () => Get.toNamed(AppRoutes.matchCancelled),
          ),
        ),
      ),
    );
  }
}
