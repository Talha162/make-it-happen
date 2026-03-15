import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/responsive.dart';

class DarkScaffold extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const DarkScaffold({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Responsive.horizontalPadding(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.maxContentWidth(context),
            ),
            child: Padding(
              padding:
                  padding ??
                  EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: AppDimens.screenPadding,
                  ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
