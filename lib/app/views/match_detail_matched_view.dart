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

class MatchDetailMatchedView extends StatelessWidget {
  const MatchDetailMatchedView({super.key});

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
                  Row(
                    children: [
                      Text('Martin K.', style: AppTextStyles.titleLarge),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.matchMarriageStatus),
                        child: Text(
                          'Cancel Match',
                          style: AppTextStyles.body.copyWith(color: AppColors.error),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    'Purpose-driven and open to a guided journey\ntoward marriage.',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  _InfoBlock(label: 'Age', value: '28'),
                  _InfoBlock(label: 'Location', value: 'Lahore, Pakistan'),
                  _InfoBlock(label: 'Match Started', value: 'June 14, 2025'),
                  Row(
                    children: [
                      Text('Status', style: AppTextStyles.label),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.matchMarriageStatus),
                        child: Text(
                          'Got Married?',
                          style: AppTextStyles.bodySmall.copyWith(color: AppColors.primaryDark),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.spacing8),
                  const MatchStatusPill(label: 'Matched'),
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
                  Text('Next Step', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    'Mentorship and learning content will support your\njourney forward.',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  _NoticeCard(
                    text: 'You are not available for new matches while\nthis match is active.',
                  ),
                  const SizedBox(height: AppDimens.spacing20),
                  SecondaryButton(
                    label: 'Get Mentorship',
                    onPressed: () => Get.toNamed(AppRoutes.mentorshipGuided),
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  PrimaryButton(
                    label: 'Chat',
                    isEnabled: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
          padding: const EdgeInsets.all(AppDimens.spacing16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.block, color: AppColors.error, size: 18),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close, color: AppColors.textMuted),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.spacing8),
              Text('Cancel Match?', style: AppTextStyles.titleMedium),
              const SizedBox(height: AppDimens.spacing6),
              Text(
                'Are you sure you want to cancel this match? Once\nyou cancel this match you would be then able to see\nnew suggestions',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: AppDimens.spacing16),
              SizedBox(
                width: double.infinity,
                height: AppDimens.buttonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3B3B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                    Get.toNamed(AppRoutes.matchDetailCancelled);
                  },
                  child: Text('Yes, Cancel Match', style: AppTextStyles.button),
                ),
              ),
              const SizedBox(height: AppDimens.spacing10),
              SecondaryButton(
                label: 'Close',
                onPressed: () => Get.back(),
              ),
            ],
          ),
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

class _NoticeCard extends StatelessWidget {
  const _NoticeCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.lightbulb, color: AppColors.accent, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: AppTextStyles.bodySmall),
          ),
        ],
      ),
    );
  }
}

