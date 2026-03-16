import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      fontFamily: 'GeneralSans',
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'GeneralSans'),
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
      ),
    );
  }
}
