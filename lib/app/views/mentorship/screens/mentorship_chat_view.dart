import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/floating_chat_button.dart';
import 'package:make_it_happen/app/widgets/mentorship_chat_bubble.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';

class MentorshipChatView extends StatefulWidget {
  const MentorshipChatView({super.key});

  @override
  State<MentorshipChatView> createState() => _MentorshipChatViewState();
}

class _MentorshipChatViewState extends State<MentorshipChatView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<_ChatMessage> _messages = [
    const _ChatMessage(
      text:
          'Hello, thank you for booking a mentorship session. I\'m looking forward to our conversation.',
      isFromMentor: true,
      time: '12:26 PM',
    ),
    const _ChatMessage(
      text: 'Hi Peace,',
      isFromMentor: false,
      showAvatar: true,
    ),
    const _ChatMessage(
      text:
          'Thank you for confirming. I\'m really looking forward to getting some guidance.',
      isFromMentor: false,
      showAvatar: true,
      time: '12:27 PM',
    ),
    const _ChatMessage(
      text:
          'Great. I see that you selected communication in relationships as the topic.',
      isFromMentor: true,
    ),
    const _ChatMessage(
      text:
          'Is there anything specific you would like us to focus on during the session?',
      isFromMentor: true,
      time: '12:26 PM',
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final value = _messageController.text.trim();
    if (value.isEmpty) return;

    setState(() {
      _messages.add(
        _ChatMessage(
          text: value,
          isFromMentor: false,
          showAvatar: true,
          time: TimeOfDay.now().format(context),
        ),
      );
      _messageController.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

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
                        child: ListView.separated(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(AppDimens.spacing12),
                          itemCount: _messages.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: AppDimens.spacing10),
                          itemBuilder: (context, index) {
                            final message = _messages[index];
                            return MentorshipChatBubble(
                              text: message.text,
                              isFromMentor: message.isFromMentor,
                              showAvatar: message.showAvatar,
                              time: message.time,
                            );
                          },
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
                                child: TextField(
                                  controller: _messageController,
                                  textInputAction: TextInputAction.send,
                                  onSubmitted: (_) => _sendMessage(),
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    border: InputBorder.none,
                                    hintText: 'Type what you have in mind...',
                                    hintStyle: AppTextStyles.body.copyWith(
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _sendMessage,
                                child: Container(
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

class _ChatMessage {
  const _ChatMessage({
    required this.text,
    required this.isFromMentor,
    this.showAvatar = false,
    this.time,
  });

  final String text;
  final bool isFromMentor;
  final bool showAvatar;
  final String? time;
}
