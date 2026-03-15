import 'package:flutter/material.dart';

import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/profile_app_bar.dart';
import 'package:make_it_happen/app/widgets/profile_scaffold.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: 'Terms & Conditions', compact: true),
          const SizedBox(height: AppDimens.spacing6),
          Text('Terms & Conditions', style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          _Section(
            title: '1. Acceptance of Terms',
            body:
                'By accessing and using this application, you agree to be bound by these terms. '
                'If you do not agree, please do not use the app.',
          ),
          _Section(
            title: '2. User Responsibilities',
            body:
                'You agree to provide accurate information, keep your account secure, and '
                'use the platform respectfully.',
          ),
          _Section(
            title: '3. Privacy & Security',
            body:
                'We value your privacy. Data is handled securely and in accordance with our '
                'privacy practices.',
          ),
          _Section(
            title: '4. Payments & Bookings',
            body:
                'Payments are processed securely. Event registrations are non-refundable '
                'unless explicitly stated.',
          ),
          _Section(
            title: '5. Changes to Terms',
            body:
                'We may update these terms periodically. Continued use indicates acceptance.',
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.spacing12),
      padding: const EdgeInsets.all(AppDimens.spacing14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.titleMedium),
          const SizedBox(height: AppDimens.spacing8),
          Text(
            body,
            style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
