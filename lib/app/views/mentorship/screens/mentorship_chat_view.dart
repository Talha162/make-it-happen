import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/floating_chat_button.dart';
import 'package:make_it_happen/app/widgets/mentorship_chat_bubble.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';

class MentorshipChatView extends StatelessWidget {
  const MentorshipChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back, color: AppColors.white),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.screenPadding,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimens.spacing10,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryDark,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(18),
                          ),
                        ),
                        child: Text(
                          'Peace',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.titleMedium,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(AppDimens.spacing12),
                          children: const [
                            MentorshipChatBubble(
                              text:
                                  'Hello, thank you for booking a mentorship session. I\'m looking forward to our conversation.',
                              isFromMentor: true,
                              time: '12:26 PM',
                            ),
                            SizedBox(height: AppDimens.spacing12),
                            MentorshipChatBubble(
                              text: 'Hi Peace,',
                              isFromMentor: false,
                              showAvatar: true,
                            ),
                            SizedBox(height: AppDimens.spacing8),
                            MentorshipChatBubble(
                              text:
                                  'Thank you for confirming. I\'m really looking forward to getting some guidance.',
                              isFromMentor: false,
                              showAvatar: true,
                              time: '12:27 PM',
                            ),
                            SizedBox(height: AppDimens.spacing12),
                            MentorshipChatBubble(
                              text:
                                  'Great. I see that you selected communication in relationships as the topic.',
                              isFromMentor: true,
                            ),
                            SizedBox(height: AppDimens.spacing8),
                            MentorshipChatBubble(
                              text:
                                  'Is there anything specific you would like us to focus on during the session?',
                              isFromMentor: true,
                              time: '12:26 PM',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppDimens.spacing12,
                          0,
                          AppDimens.spacing12,
                          AppDimens.spacing12,
                        ),
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.spacing12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.fieldFill,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Type what you have in mind...',
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.accent,
                                      AppColors.primaryDark,
                                    ],
                                  ),
                                ),
                                child: const Icon(
                                  LucideIcons.send,
                                  size: 16,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                AppDimens.spacing16,
                AppDimens.screenPadding,
                AppDimens.spacing16,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  FloatingChatButton(onTap: () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.screenPadding,
                0,
                AppDimens.screenPadding,
                AppDimens.spacing24,
              ),
              child: PrimaryButton(
                label: 'Continue',
                isEnabled: false,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
