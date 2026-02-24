import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/match_preference_chip.dart';
import '../widgets/match_status_pill.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

class MatchDetailAvailableView extends StatelessWidget {
  const MatchDetailAvailableView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _HeroHeader(imagePath: AppAssets.martinKImage),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                AppDimens.spacing16,
                AppDimens.screenPadding,
                AppDimens.spacing24,
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
                  _InfoBlock(label: 'Age', value: '28'),
                  _InfoBlock(label: 'Location', value: 'Lahore, Pakistan'),
                  const SizedBox(height: AppDimens.spacing4),
                  Text('Status', style: AppTextStyles.label),
                  const SizedBox(height: AppDimens.spacing8),
                  const MatchStatusPill(label: 'Available'),
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
                  const SizedBox(height: AppDimens.spacing20),
                  SecondaryButton(
                    label: 'Not Interested',
                    onPressed: () {},
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  PrimaryButton(
                    label: 'Request Match',
                    isEnabled: true,
                    onPressed: () => Get.toNamed(AppRoutes.matchDetailRequested),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _Dot(isActive: false),
                _Dot(isActive: true),
                _Dot(isActive: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryDark : AppColors.white.withOpacity(0.45),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.spacing12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.label),
          const SizedBox(height: AppDimens.spacing6),
          Text(value, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

