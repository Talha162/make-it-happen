import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../routes/app_routes.dart';
import '../widgets/primary_button.dart';

enum EventDetailMode { available, registered, full }

class EventDetailView extends StatelessWidget {
  const EventDetailView({super.key, required this.mode});

  final EventDetailMode mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _HeroSection(mode: mode),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                AppDimens.spacing20,
                AppDimens.screenPadding,
                AppDimens.spacing24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Community Hangout', style: AppTextStyles.titleLarge),
                  const SizedBox(height: AppDimens.spacing8),
                  Text(
                    'A guided in-person gathering organized by the\nministry.',
                    style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  _InfoBlock(label: 'Date', value: 'June 14, 2025'),
                  _InfoBlock(label: 'Time', value: 'Start: 8:00 AM | End: 6:00 PM'),
                  _InfoBlock(label: 'Location', value: 'Yosemite National Park'),
                  if (mode == EventDetailMode.available)
                    _InfoBlock(label: 'Event Fee', value: '\$100'),
                  if (mode == EventDetailMode.registered)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        SizedBox(height: AppDimens.spacing8),
                        Text('Status', style: AppTextStyles.label),
                        SizedBox(height: AppDimens.spacing8),
                        _StatusPill(label: 'Registered', icon: LucideIcons.tag, isFilled: true),
                      ],
                    ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('What to Expect', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing8),
                  _Bullet(text: 'Guided group sessions'),
                  _Bullet(text: 'Ministry-led teachings'),
                  _Bullet(text: 'Safe and respectful interactions'),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Cancellation Policy', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    'Registrations are non-refundable unless the event is\ncancelled by the ministry.',
                    style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppDimens.spacing24),
                  if (mode == EventDetailMode.full)
                    _FullNotice()
                  else if (mode == EventDetailMode.available)
                    PrimaryButton(
                      label: 'Register and Pay',
                      isEnabled: true,
                      onPressed: () => Get.toNamed(AppRoutes.eventConfirm),
                    )
                  else
                    PrimaryButton(
                      label: 'View Ticket',
                      isEnabled: true,
                      onPressed: () => Get.toNamed(AppRoutes.eventDetailFull),
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

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.mode});

  final EventDetailMode mode;

  @override
  Widget build(BuildContext context) {
    final heroPath = mode == EventDetailMode.available
        ? AppAssets.communityHangoutRegPayImage
        : AppAssets.communityHangoutImage;
    return SizedBox(
      height: 260,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              heroPath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: AppDimens.spacing12,
            left: AppDimens.spacing12,
            child: _BackButton(),
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

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0x55000000),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white, size: 20),
        onPressed: () => Navigator.of(context).maybePop(),
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
        color: isActive ? AppColors.primaryDark : AppColors.white.withOpacity(0.4),
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
          Text(
            value,
            style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.spacing6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: AppColors.textPrimary)),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.label,
    required this.icon,
    required this.isFilled,
  });

  final String label;
  final IconData icon;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isFilled ? AppColors.chipFill : AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.white),
          const SizedBox(width: 6),
          Text(label, style: AppTextStyles.chip),
        ],
      ),
    );
  }
}

class _FullNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.badgeAlert, color: AppColors.accent, size: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'This event is fully booked.',
              style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}

