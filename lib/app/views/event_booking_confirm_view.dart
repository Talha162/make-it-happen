import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../widgets/primary_button.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../widgets/secondary_button.dart';

class EventBookingConfirmView extends StatelessWidget {
  const EventBookingConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
            child: Container(
              padding: const EdgeInsets.all(AppDimens.spacing20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: AppColors.surfaceElevated,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(LucideIcons.calendar, color: AppColors.white, size: 18),
                      ),
                      const SizedBox(width: AppDimens.spacing10),
                      Expanded(
                        child: Text(
                          'Confirm Booking?',
                          style: AppTextStyles.titleMedium,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: const Icon(Icons.close, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  Text(
                    'You are about to register for this event and\ncomplete the payment.',
                    style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  _InfoRow(label: 'Event', value: 'Community Hangout'),
                  _InfoRow(label: 'Date', value: 'June 14, 2025, 8:00 AM - 6:00 PM'),
                  _InfoRow(label: 'Location', value: 'Yosemite National Park'),
                  _InfoRow(label: 'Event Fee', value: '\$100'),
                  const SizedBox(height: AppDimens.spacing18),
                  PrimaryButton(
                    label: 'Book Now',
                    isEnabled: true,
                    onPressed: () => Get.toNamed(AppRoutes.eventSuccess),
                  ),
                  const SizedBox(height: AppDimens.spacing12),
                  SecondaryButton(
                    label: 'Cancel',
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.spacing10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted)),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1, color: AppColors.divider),
        ],
      ),
    );
  }
}

