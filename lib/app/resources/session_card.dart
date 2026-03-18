import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_it_happen/app/resources/status_pill.dart';

import '../data/models/session_status.dart';
import 'app_assets.dart';
import 'app_dimens.dart';
import 'app_text_styles.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({super.key, required this.session});

  final SessionItem session;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2C2C2E)),
      ),
      child: Row(
        children: [
          /// 📅 Icon
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                colors: [Color(0xFF7B61FF), Color(0xFF2F80ED)],
              ),
            ),
            child: Center(
              child: Image.asset(
                AppAssets.calenderClock, // 🔥 YOUR ASSET
                height: 22,
                width: 22,
              ),
            ),
          ),

          const SizedBox(width: AppDimens.spacing12),

          /// 📄 Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.title,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontFamily: 'GeneralSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  session.date,
                  style: AppTextStyles.body.copyWith(
                    fontFamily: 'GeneralSans',
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: AppDimens.spacing10),

                /// 🏷 Status
                StatusPill(status: session.status),
              ],
            ),
          ),
        ],
      ),
    );
  }
}