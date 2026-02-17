import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_text_styles.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.divider)),
        const SizedBox(width: AppDimens.spacing12),
        Text(text, style: AppTextStyles.caption),
        const SizedBox(width: AppDimens.spacing12),
        const Expanded(child: Divider(color: AppColors.divider)),
      ],
    );
  }
}
