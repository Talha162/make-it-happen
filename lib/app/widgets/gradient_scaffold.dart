import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import 'gradient_background.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool blackBottomSafeArea;

  const GradientScaffold({
    super.key,
    required this.child,
    this.padding,
    this.blackBottomSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          GradientBackground(
            child: SafeArea(
              child: Padding(
                padding:
                    padding ?? const EdgeInsets.all(AppDimens.screenPadding),
                child: child,
              ),
            ),
          ),
          if (blackBottomSafeArea && bottomInset > 0)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(height: bottomInset, color: AppColors.black),
            ),
        ],
      ),
    );
  }
}
