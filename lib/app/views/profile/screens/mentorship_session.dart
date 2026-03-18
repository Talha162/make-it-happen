import 'package:flutter/material.dart';

import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_strings.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/profile_app_bar.dart';
import 'package:make_it_happen/app/widgets/profile_scaffold.dart';

import '../../../data/models/session_status.dart';
import '../../../resources/session_card.dart';

class MentorshipSessionsView extends StatelessWidget {
  const MentorshipSessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final sessions = [
      SessionItem(
        title: 'General mentorship',
        date: '16 Feb, 2025 - 08:00 PM',
        status: SessionStatus.completed,
      ),
      SessionItem(
        title: 'Spiritual guidance',
        date: '20 Feb, 2025 - 10:00 AM',
        status: SessionStatus.scheduled,
      ),
      SessionItem(
        title: 'Conflict resolution',
        date: '25 Feb, 2025 - 02:00 PM',
        status: SessionStatus.completed,
      ),
      SessionItem(
        title: 'Pre-marriage guidance',
        date: '01 Mar, 2025 - 11:00 AM',
        status: SessionStatus.scheduled,
      ),
      SessionItem(
        title: 'General mentorship',
        date: '16 Feb, 2025 - 08:00 PM',
        status: SessionStatus.scheduled,
      ),
      SessionItem(
        title: 'Pre-marriage guidance',
        date: '10 Mar, 2025 - 03:00 PM',
        status: SessionStatus.scheduled,
      ),
    ];

    return ProfileScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(
            title: AppStrings.mentorshipSessions,
            compact: true,
          ),
          const SizedBox(height: AppDimens.spacing6),
          Text(
            AppStrings.mentorshipSessions,
            style: AppTextStyles.titleLarge,
          ),
          const SizedBox(height: AppDimens.spacing16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sessions.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppDimens.spacing12),
            itemBuilder: (context, index) {
              return SessionCard(session: sessions[index]);
            },
          ),
        ],
      ),
    );
  }
}
