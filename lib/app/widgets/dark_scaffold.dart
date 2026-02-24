import 'package:flutter/material.dart';

import '../resources/app_dimens.dart';
import 'gradient_background.dart';

class DarkScaffold extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const DarkScaffold({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppDimens.screenPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}
