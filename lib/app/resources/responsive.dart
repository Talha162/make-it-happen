import 'package:flutter/material.dart';

class Responsive {
  static double horizontalPadding(BuildContext context, {double base = 24}) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return 16;
    if (width < 390) return 20;
    if (width >= 700) return 32;
    return base;
  }

  static double maxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1200) return 520;
    if (width >= 900) return 500;
    if (width >= 700) return 460;
    return width;
  }
}
