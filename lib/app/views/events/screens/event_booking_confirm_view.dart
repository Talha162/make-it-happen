import 'package:flutter/material.dart';

import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';

class EventBookingConfirmView extends StatelessWidget {
  const EventBookingConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.arrow_back, color: AppColors.white),
                ),
              ),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 366),
                    child: SizedBox(
                      width: double.infinity,
                      height: 430,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF333333),
                            width: 1,
                          ),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight,
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _Header(),
                                    SizedBox(height: 20),
                                    _DetailSection(
                                      label: 'Event',
                                      value: 'Community Hangout',
                                    ),
                                    _DetailSection(
                                      label: 'Date',
                                      value: 'June 14, 2025',
                                    ),
                                    _DetailSection(
                                      label: 'Time',
                                      value: '8:00 AM - 6:00 PM',
                                    ),
                                    _DetailSection(
                                      label: 'Location',
                                      value: 'Yosemite National Park',
                                    ),
                                    _PriceSection(),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Booking Confirmed!',
          style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: 10),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF068EFF),
          ),
          child: const Icon(Icons.check, color: AppColors.white, size: 20),
        ),
      ],
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppTextStyles.titleLarge.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFF333333)),
        ],
      ),
    );
  }
}

class _PriceSection extends StatelessWidget {
  const _PriceSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Total Price:',
              style: AppTextStyles.titleMedium.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF7B3FF2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Paid',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          '1,120 Rs',
          style: AppTextStyles.titleLarge.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
