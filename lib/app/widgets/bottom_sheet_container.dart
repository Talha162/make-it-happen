import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  final double maxHeightFactor;
  final double minHeightFactor;
  final double initialHeightFactor;
  final bool draggable;

  const BottomSheetContainer({
    super.key,
    required this.child,
    this.maxHeightFactor = 0.85,
    this.minHeightFactor = 0.60,
    this.initialHeightFactor = 0.70,
    this.draggable = true,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    Widget sheetContent(ScrollController controller) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.sheetTop,
              AppColors.sheetMid,
              AppColors.sheetBottom,
            ],
            stops: [0.0, 0.45, 1.0],
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimens.cardRadius),
          ),
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.screenPadding,
              vertical: AppDimens.screenPadding,
            ),
            child: SingleChildScrollView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.only(
                        bottom: AppDimens.spacing16,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.textMuted,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child,
                ],
              ),
            ),
          ),
        ),
      );
    }

    final sheet = DraggableScrollableSheet(
      expand: false,
      minChildSize: minHeightFactor,
      maxChildSize: maxHeightFactor,
      initialChildSize: initialHeightFactor.clamp(
        minHeightFactor,
        maxHeightFactor,
      ),
      builder: (context, controller) => sheetContent(controller),
    );

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: draggable ? sheet : sheetContent(ScrollController()),
      ),
    );
  }
}
