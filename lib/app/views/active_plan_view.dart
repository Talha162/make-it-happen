import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/info_card.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_scaffold.dart';

class ActivePlanView extends StatelessWidget {
  const ActivePlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.activePlan,compact: true,),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.activePlan, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          InfoCard(
            title: 'Plan 3',
            subtitle: 'Access matchmaking, learning content, mentorship...',
            leading: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(LucideIcons.shieldCheck, size: 16, color: AppColors.white),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text('\$89.99/Month', style: TextStyle(color: AppColors.textPrimary, fontSize: 12)),
                SizedBox(height: 4),
                Text('24 Feb, 2026', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(height: AppDimens.spacing16),
          const Text('Payments', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: AppDimens.spacing10),
          ..._payments.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppDimens.spacing10),
              child: InfoCard(
                title: item.title,
                subtitle: item.subtitle,
                chipText: 'Paid',
                chipColor: AppColors.success,
                leading: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(LucideIcons.badgeDollarSign, size: 16, color: AppColors.white),
                ),
                trailing: Text(item.amount, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentItem {
  _PaymentItem({required this.title, required this.subtitle, required this.amount});

  final String title;
  final String subtitle;
  final String amount;
}

final _payments = <_PaymentItem>[
  _PaymentItem(
    title: 'Subscription Plan',
    subtitle: 'Premium Plan • Next billing: 22 July 2026',
    amount: '\$19/month',
  ),
  _PaymentItem(
    title: 'Subscription Plan',
    subtitle: 'Premium Plan • Next billing: 22 June 2026',
    amount: '\$25/month',
  ),
  _PaymentItem(
    title: 'Mentorship Session',
    subtitle: 'Communication Mentorship • 18 June 2026',
    amount: '\$15',
  ),
  _PaymentItem(
    title: 'Event Payment',
    subtitle: 'Community Hangout • 14 June 2026',
    amount: '\$19',
  ),
];
