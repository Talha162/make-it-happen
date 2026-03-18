import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/profile_app_bar.dart';
import 'package:make_it_happen/app/widgets/secondary_button.dart';

class CompleteFeedbackView extends StatefulWidget {
  const CompleteFeedbackView({super.key});

  @override
  State<CompleteFeedbackView> createState() => _CompleteFeedbackViewState();
}

class _CompleteFeedbackViewState extends State<CompleteFeedbackView> {
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _improveController = TextEditingController();
  bool _mentorshipSupport = true;

  @override
  void dispose() {
    _reasonController.dispose();
    _improveController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.offAllNamed(AppRoutes.matchSuggestions);
  }

  @override
  Widget build(BuildContext context) {
    const bottomInset = AppDimens.buttonHeight + AppDimens.buttonHeight + 56;

    return Scaffold(
      backgroundColor: AppColors.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.fromLTRB(
                    AppDimens.screenPadding,
                    AppDimens.spacing12,
                    AppDimens.screenPadding,
                    bottomInset,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileAppBar(
                        title: 'Complete Feedback',
                        compact: true,
                      ),
                      const SizedBox(height: AppDimens.spacing6),
                      Text(
                        'Complete Feedback',
                        style: AppTextStyles.titleLarge.copyWith(
                          fontSize: 52 / 2,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GeneralSans',
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing32),
                      Text(
                        'Reason for cancellation',
                        style: AppTextStyles.titleLarge.copyWith(
                          fontSize: 28 / 2,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GeneralSans',
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing12),
                      _FeedbackArea(
                        controller: _reasonController,
                        hintText: 'Briefly share your reason',
                      ),
                      const SizedBox(height: AppDimens.spacing20),
                      Text(
                        'Anything we can improve',
                        style: AppTextStyles.titleLarge.copyWith(
                          fontSize: 28 / 2,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GeneralSans',
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing12),
                      _FeedbackArea(
                        controller: _improveController,
                        hintText: 'Share any helpful feedback',
                      ),
                      const SizedBox(height: AppDimens.spacing20),
                      Text(
                        'Would you like mentorship support?',
                        style: AppTextStyles.titleLarge.copyWith(
                          fontSize: 28 / 2,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GeneralSans',
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing12),
                      Row(
                        children: [
                          _Choice(
                            label: 'Yes',
                            selected: _mentorshipSupport,
                            onTap: () =>
                                setState(() => _mentorshipSupport = true),
                          ),
                          const SizedBox(width: AppDimens.spacing20),
                          _Choice(
                            label: 'No',
                            selected: !_mentorshipSupport,
                            onTap: () =>
                                setState(() => _mentorshipSupport = false),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: AppDimens.screenPadding,
                right: AppDimens.screenPadding,
                bottom: AppDimens.spacing16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SecondaryButton(
                      label: 'Cancel',
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Get.back();
                      },
                    ),
                    const SizedBox(height: AppDimens.spacing12),
                    PrimaryButton(
                      label: 'Submit Feedback',
                      isEnabled: true,
                      onPressed: _submitFeedback,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeedbackArea extends StatelessWidget {
  const _FeedbackArea({required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(AppDimens.spacing12),
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        controller: controller,
        expands: true,
        maxLines: null,
        textInputAction: TextInputAction.done,
        onEditingComplete: () => FocusManager.instance.primaryFocus?.unfocus(),
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        style: AppTextStyles.body.copyWith(
          color: AppColors.textPrimary,
          fontFamily: 'GeneralSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: AppTextStyles.body.copyWith(
            color: AppColors.textSecondary,
            fontFamily: 'GeneralSans',
          ),
        ),
      ),
    );
  }
}

class _Choice extends StatelessWidget {
  const _Choice({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: selected ? AppColors.primaryDark : AppColors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? AppColors.primaryDark : AppColors.white,
                width: 2,
              ),
            ),
            child: selected
                ? const Icon(Icons.check, color: AppColors.black, size: 16)
                : null,
          ),
          const SizedBox(width: AppDimens.spacing8),
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
              fontFamily: 'GeneralSans',
            ),
          ),
        ],
      ),
    );
  }
}
