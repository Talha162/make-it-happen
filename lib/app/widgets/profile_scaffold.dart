import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/responsive.dart';
import '../routes/app_routes.dart';
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
    final horizontalPadding = Responsive.horizontalPadding(context);
    final bottomInset = showBottomButton
        ? (AppDimens.buttonHeight + AppDimens.spacing24)
        : 0.0;

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.maxContentWidth(context),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                      top: padding.top,
                      bottom: padding.bottom + bottomInset,
                    ),
                    child: SingleChildScrollView(
                      child: child,
                    ),
                  ),
                ),
                if (showBottomButton && bottomLabel != null)
                  Positioned(
                    left: horizontalPadding,
                    right: horizontalPadding,
                    bottom: AppDimens.spacing16,
                    child: PrimaryButton(
                      label: bottomLabel!,
                      onPressed: () {
                        onBottomTap?.call();
                        Get.offNamed(AppRoutes.profile);
                      },
                      isEnabled: true,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
