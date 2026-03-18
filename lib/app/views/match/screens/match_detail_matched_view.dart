import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/widgets/match_detail_sections.dart';
import 'package:make_it_happen/app/widgets/message_popup.dart';
import 'package:make_it_happen/app/widgets/match_preference_chip.dart';
import 'package:make_it_happen/app/widgets/match_status_pill.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/secondary_button.dart';

import 'cancel_dialog.dart';

class MatchDetailMatchedView extends StatelessWidget {
  const MatchDetailMatchedView({super.key});

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
              AppDimens.spacing24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Martin K.', style: AppTextStyles.titleLarge),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        CancelDialog.show(context: context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: AppColors.error),
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
                const MatchDetailInfoBlock(label: 'Age', value: '28'),
                const MatchDetailInfoBlock(
                  label: 'Location',
                  value: 'Lahore, Pakistan',
                ),
                const MatchDetailInfoBlock(
                  label: 'Match Started',
                  value: 'June 14, 2025',
                ),
                Row(
                  children: [
                    Text('Status', style: AppTextStyles.label),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.matchMarriageStatus),
                      child: Text(
                        'Got Married?',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primaryDark,
                        ),
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
                const MatchNoticeCard(
                  text:
                      'You are not available for new matches while\nthis match is active.',
                  icon: Icons.lightbulb,
                  iconColor: AppColors.accent,
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
                  onPressed: () => showMessagePopup(
                    participantName: 'Martin K.',
                    onContinue: () =>
                        Get.toNamed(AppRoutes.mentorshipSessions),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void _showCancelDialog(BuildContext context) {
  //   showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => Dialog(
  //       backgroundColor: Colors.transparent,
  //       insetPadding: const EdgeInsets.symmetric(
  //         horizontal: AppDimens.screenPadding,
  //       ),
  //       child: Container(
  //         padding: const EdgeInsets.all(AppDimens.spacing16),
  //         decoration: BoxDecoration(
  //           color: AppColors.card,
  //           borderRadius: BorderRadius.circular(16),
  //           border: Border.all(color: AppColors.border),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             /// 🔴 Top Row
  //             Row(
  //               children: [
  //                 Container(
  //                   height: 32,
  //                   width: 32,
  //                   decoration: const BoxDecoration(
  //                     color: Color(0xFFFFE6E6),
  //                     shape: BoxShape.circle,
  //                   ),
  //                   child: const Icon(
  //                     Icons.block,
  //                     color: AppColors.error,
  //                     size: 18,
  //                   ),
  //                 ),
  //                 const Spacer(),
  //                 IconButton(
  //                   onPressed: () => Get.back(),
  //                   icon: const Icon(
  //                     Icons.close,
  //                     color: AppColors.textMuted,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //
  //             const SizedBox(height: AppDimens.spacing8),
  //
  //             /// 📝 Title
  //             Text(
  //               'Cancel Match?',
  //               style: AppTextStyles.titleMedium.copyWith(
  //                 fontFamily: 'GeneralSans',
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //                 height: 1.2,
  //                 decoration: TextDecoration.none,
  //                 color: AppColors.textPrimary,
  //               ),
  //             ),
  //
  //             const SizedBox(height: AppDimens.spacing6),
  //
  //             /// 📄 Description
  //             Text(
  //               'Are you sure you want to cancel this match? Once you cancel this match you will be able to see new suggestions.',
  //               style: AppTextStyles.body.copyWith(
  //                 fontFamily: 'GeneralSans',
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 14,
  //                 height: 1.4,
  //                 decoration: TextDecoration.none,
  //                 color: AppColors.textSecondary,
  //               ),
  //             ),
  //
  //             const SizedBox(height: AppDimens.spacing16),
  //
  //             /// 🔴 Cancel Button
  //             SizedBox(
  //               width: double.infinity,
  //               height: AppDimens.buttonHeight,
  //               child: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: const Color(0xFFFF3B3B),
  //                   elevation: 0,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(
  //                       AppDimens.buttonRadius,
  //                     ),
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   Get.back();
  //                   Get.toNamed(AppRoutes.matchDetailCancelled);
  //                 },
  //                 child: Text(
  //                   'Yes, Cancel Match',
  //                   style: AppTextStyles.button.copyWith(
  //                     fontFamily: 'GeneralSans',
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 14,
  //                     height: 1.2,
  //                     decoration: TextDecoration.none,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //
  //             const SizedBox(height: AppDimens.spacing10),
  //
  //             /// ⚪ Close Button
  //             SecondaryButton(
  //               label: 'Close',
  //               onPressed: () => Get.back(),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
