import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../widgets/info_card.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_scaffold.dart';

class MentorshipSessionsView extends StatelessWidget {
  const MentorshipSessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(
            title: AppStrings.mentorshipSessions,
            compact: true,
          ),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.mentorshipSessions, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          ..._sessions.map(
            (session) => Padding(
              padding: const EdgeInsets.only(bottom: AppDimens.spacing10),
              child: InfoCard(
                title: session.title,
                subtitle: session.time,
                chipText: session.status,
                chipColor: session.isCompleted
                    ? AppColors.statusCompletedText
                    : AppColors.statusScheduledText,
                chipBackground: session.isCompleted
                    ? AppColors.statusCompletedBg
                    : AppColors.statusScheduledBg,
                leading: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    LucideIcons.calendar,
                    size: 16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Session {
  _Session({
    required this.title,
    required this.time,
    required this.status,
    required this.isCompleted,
  });

  final String title;
  final String time;
  final String status;
  final bool isCompleted;
}

final _sessions = <_Session>[
  _Session(
    title: 'General mentorship',
    time: '16 Feb, 2026 • 08:00 PM',
    status: 'Completed',
    isCompleted: true,
  ),
  _Session(
    title: 'Spiritual guidance',
    time: '20 Feb, 2026 • 10:00 AM',
    status: 'Scheduled',
    isCompleted: false,
  ),
  _Session(
    title: 'Conflict resolution',
    time: '25 Feb, 2026 • 02:00 PM',
    status: 'Completed',
    isCompleted: true,
  ),
  _Session(
    title: 'Pre-marriage guidance',
    time: '01 Mar, 2026 • 11:00 AM',
    status: 'Scheduled',
    isCompleted: false,
  ),
  _Session(
    title: 'General mentorship',
    time: '16 Feb, 2026 • 08:00 PM',
    status: 'Completed',
    isCompleted: true,
  ),
  _Session(
    title: 'Pre-marriage guidance',
    time: '10 Mar, 2026 • 03:00 PM',
    status: 'Scheduled',
    isCompleted: false,
  ),
];

