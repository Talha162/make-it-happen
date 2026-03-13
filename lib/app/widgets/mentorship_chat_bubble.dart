import 'package:flutter/material.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class MentorshipChatBubble extends StatelessWidget {
  const MentorshipChatBubble({
    super.key,
    required this.text,
    required this.isFromMentor,
    this.showAvatar = false,
    this.time,
  });

  final String text;
  final bool isFromMentor;
  final bool showAvatar;
  final String? time;

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isFromMentor ? AppColors.primaryDark : AppColors.card;
    final align = isFromMentor
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: align,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: isFromMentor
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            if (!isFromMentor && showAvatar) ...[
              const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(AppAssets.martinKImage),
              ),
              const SizedBox(width: AppDimens.spacing8),
            ],
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.spacing12,
                  vertical: AppDimens.spacing10,
                ),
                decoration: BoxDecoration(
                  color: bubbleColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  text,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (time != null) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              time!,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
