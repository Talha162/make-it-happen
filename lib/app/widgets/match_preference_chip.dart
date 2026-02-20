import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';

class MatchPreferenceChip extends StatelessWidget {
  const MatchPreferenceChip({
    super.key,
    required this.label,
    this.background = const Color(0xFFBFE6FF),
    this.textColor = const Color(0xFF1B6EDC),
  });

  final String label;
  final Color background;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
