import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import 'primary_button.dart';

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppDimens.screenPadding,
      vertical: AppDimens.spacing16,
    ),
    this.showBottomButton = false,
    this.bottomLabel,
    this.onBottomTap,
  });

  final Widget child;
  final EdgeInsets padding;
  final bool showBottomButton;
  final String? bottomLabel;
  final VoidCallback? onBottomTap;

  @override
  Widget build(BuildContext context) {
    final bottomInset = showBottomButton
        ? (AppDimens.buttonHeight + AppDimens.spacing24)
        : 0.0;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: padding.add(EdgeInsets.only(bottom: bottomInset)),
              child: SingleChildScrollView(
                child: child,
              ),
            ),
            if (showBottomButton && bottomLabel != null)
              Positioned(
                left: AppDimens.screenPadding,
                right: AppDimens.screenPadding,
                bottom: AppDimens.spacing16,
                child: PrimaryButton(
                  label: bottomLabel!,
                  onPressed: onBottomTap,
                  isEnabled: true,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

