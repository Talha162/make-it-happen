import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class LearnDetailHeroHeader extends StatelessWidget {
  const LearnDetailHeroHeader({
    super.key,
    required this.imagePath,
    this.showPlayButton = false,
  });

  final String imagePath;
  final bool showPlayButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),
          Positioned(
            top: 12,
            left: 12,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
            ),
          ),
          if (showPlayButton)
            const Center(
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Color(0x66000000),
                child: Icon(Icons.play_arrow, color: AppColors.white, size: 20),
              ),
            ),
        ],
      ),
    );
  }
}

class LearnDetailStatusPill extends StatelessWidget {
  const LearnDetailStatusPill({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: AppTextStyles.body.copyWith(color: AppColors.white),
      ),
    );
  }
}

class LearnDetailBullet extends StatelessWidget {
  const LearnDetailBullet({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('\u2022 ', style: TextStyle(color: AppColors.textPrimary)),
          Expanded(child: Text(text, style: AppTextStyles.bodySmall)),
        ],
      ),
    );
  }
}

class LearnCompletionNotice extends StatelessWidget {
  const LearnCompletionNotice({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.spacing12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.lightbulb, color: AppColors.accent, size: 16),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: AppTextStyles.bodySmall)),
        ],
      ),
    );
  }
}
