import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

class EventBookingSuccessView extends StatelessWidget {
  const EventBookingSuccessView({super.key});

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
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.arrow_back, color: AppColors.white),
              ),
            ),
            const SizedBox(height: AppDimens.spacing8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
              child: Container(
                padding: const EdgeInsets.all(AppDimens.spacing20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Booking Confirmed!',
                          style: AppTextStyles.titleMedium,
                        ),
                        const SizedBox(width: 6),
                        const Icon(LucideIcons.badgeCheck, size: 16, color: AppColors.primaryDark),
                      ],
                    ),
                    const SizedBox(height: AppDimens.spacing12),
                    _InfoRow(label: 'Event', value: 'Community Hangout'),
                    _InfoRow(label: 'Date', value: 'June 14, 2025'),
                    _InfoRow(label: 'Time', value: '8:00 AM - 6:00 PM'),
                    _InfoRow(label: 'Location', value: 'Yosemite National Park'),
                    Row(
                      children: [
                        Text('Total Price', style: AppTextStyles.bodySmall),
                        const Spacer(),
                        Text('1,120 Rs', style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
                        const SizedBox(width: 8),
                        _TagPill(label: 'Paid'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
              child: SecondaryButton(
                label: 'View Ticket',
                onPressed: () => Get.toNamed(AppRoutes.eventDetailRegistered),
              ),
            ),
            const SizedBox(height: AppDimens.spacing12),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                0,
                AppDimens.screenPadding,
                AppDimens.spacing24,
              ),
              child: PrimaryButton(
                label: 'View Bookings',
                isEnabled: true,
                onPressed: () => Get.toNamed(AppRoutes.events),
              ),
            ),
          ],
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
          Text(value, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          const Divider(height: 1, color: AppColors.divider),
        ],
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  const _TagPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.statusPaidBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.statusPaidText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

