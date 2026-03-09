import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';
import '../routes/app_routes.dart';
import '../widgets/primary_button.dart';

enum EventDetailMode { available, registered, full }

class EventDetailView extends StatefulWidget {
  const EventDetailView({super.key, required this.mode});

  final EventDetailMode mode;

  @override
  State<EventDetailView> createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowBookingDialog());
  }

  void _maybeShowBookingDialog() {
    if (_dialogShown || widget.mode != EventDetailMode.registered) return;
    final args = Get.arguments;
    final shouldShow = args is Map && args['showBookingDialog'] == true;
    if (!shouldShow) return;
    _dialogShown = true;
    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (_) => const _BookingConfirmedDialog(),
    );
  }

  Future<void> _handleBookNow() async {
    final result = await Get.toNamed(AppRoutes.eventPayment);
    if (result == true && mounted) {
      Get.offNamed(
        AppRoutes.eventDetailRegistered,
        arguments: {'showBookingDialog': true},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _HeroSection(mode: widget.mode),
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
                    'A guided in-person gathering organized by the ministry.',
                    style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  _InfoBlock(label: 'Date', value: 'Jun 14, 2026'),
                  _InfoBlock(label: 'Time', value: '8:00 AM - 6:00 PM'),
                  _InfoBlock(label: 'Location', value: 'Yosemite National Park'),
                  if (widget.mode == EventDetailMode.available)
                    _InfoBlock(label: 'Event Fee', value: '\$100')
                  else ...[
                    Text('Status', style: AppTextStyles.label),
                    const SizedBox(height: AppDimens.spacing8),
                    const _StatusPill(label: 'Registered', icon: LucideIcons.lightbulb, isFilled: true),
                  ],
                  const SizedBox(height: AppDimens.spacing16),
                  Text('What to Expect', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing8),
                  const _Bullet(text: 'Guided group sessions'),
                  const _Bullet(text: 'Ministry-led teachings'),
                  const _Bullet(text: 'Safe and respectful interactions'),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Cancellation Policy', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing6),
                  Text(
                    'Registrations are non-refundable unless the event is cancelled by the ministry.',
                    style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppDimens.spacing24),
                  if (widget.mode == EventDetailMode.full)
                    const _FullNotice()
                  else if (widget.mode == EventDetailMode.available)
                    PrimaryButton(
                      label: 'Book Now',
                      isEnabled: true,
                      onPressed: _handleBookNow,
                    )
                  else
                    PrimaryButton(
                      label: 'View Ticket',
                      isEnabled: true,
                      onPressed: () => Get.toNamed(AppRoutes.eventSuccess),
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
            child: Image.asset(heroPath, fit: BoxFit.cover),
          ),
          Positioned(
            top: AppDimens.spacing12,
            left: AppDimens.spacing12,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color(0x55000000),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.white, size: 20),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
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
          Text(value, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
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
  const _FullNotice();

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

class _BookingConfirmedDialog extends StatelessWidget {
  const _BookingConfirmedDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: AppDimens.screenPadding),
      child: Container(
        padding: const EdgeInsets.all(AppDimens.spacing20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Booking Confirmed!', style: AppTextStyles.titleMedium),
                const SizedBox(width: 6),
                const Icon(LucideIcons.badgeCheck, size: 16, color: AppColors.primaryDark),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.close, color: AppColors.textMuted, size: 20),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.spacing12),
            const _DialogInfoRow(label: 'Event', value: 'Community Hangout'),
            const _DialogInfoRow(label: 'Date', value: 'Jun 14, 2026'),
            const _DialogInfoRow(label: 'Time', value: '8:00 AM - 6:00 PM'),
            const _DialogInfoRow(label: 'Location', value: 'Yosemite National Park'),
            Row(
              children: [
                Text('Total Price', style: AppTextStyles.bodySmall),
                const Spacer(),
                Text('\$100', style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
                const SizedBox(width: 8),
                const _TagPill(label: 'Paid'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogInfoRow extends StatelessWidget {
  const _DialogInfoRow({required this.label, required this.value});

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
