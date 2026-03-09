import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';

class ProgressDots extends StatelessWidget {
  final int count;
  final int activeIndex;

  const ProgressDots({
    super.key,
    required this.count,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return Container(
          width: AppDimens.progressDotSize,
          height: AppDimens.progressDotSize,
          margin: EdgeInsets.symmetric(horizontal: AppDimens.progressDotGap),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryDark : const Color(0xFF4E6473),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
