import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimens.dart';

class AppTextStyles {
  static TextStyle get splashTitle => const TextStyle(
        fontSize: AppDimens.splashTitleSize,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontSize: AppDimens.titleLarge,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleMedium => const TextStyle(
        fontSize: AppDimens.titleMedium,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get body => const TextStyle(
        fontSize: AppDimens.body,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  static TextStyle get bodyMuted => const TextStyle(
        fontSize: AppDimens.body,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontSize: AppDimens.bodySmall,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
      );

  static TextStyle get button => const TextStyle(
        fontSize: AppDimens.body,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      );

  static TextStyle get buttonDark => const TextStyle(
        fontSize: AppDimens.body,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get caption => const TextStyle(
        fontSize: AppDimens.bodySmall,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
      );

  static TextStyle get chip => const TextStyle(
        fontSize: AppDimens.bodySmall,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      );

  static TextStyle get label => const TextStyle(
        fontSize: AppDimens.bodySmall,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      );
}
