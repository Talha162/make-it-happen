import 'package:flutter/material.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';

class FloatingChatButton extends StatelessWidget {
  const FloatingChatButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Ink(
        width: 52,
        height: 52,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [AppColors.accent, AppColors.primaryDark],
          ),
        ),
        child: Center(
          child: Image.asset(
            AppAssets.messageIcon,
            width: 22,
            height: 22,
            fit: BoxFit.contain,
            color: AppColors.white,
            colorBlendMode: BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
