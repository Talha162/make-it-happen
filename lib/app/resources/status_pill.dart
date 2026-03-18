import 'package:flutter/cupertino.dart';

import '../data/models/session_status.dart';

class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.status});

  final SessionStatus status;

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == SessionStatus.completed;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isCompleted
              ? const Color(0xFF00C2C7)
              : const Color(0xFFB620E0),
        ),
      ),
      child: Text(
        isCompleted ? 'Completed' : 'Scheduled',
        style: TextStyle(
          fontFamily: 'GeneralSans',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: isCompleted
              ? const Color(0xFF00C2C7)
              : const Color(0xFFB620E0),
        ),
      ),
    );
  }
}