import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/widgets/mentorship_chat_bubble.dart';

Future<void> showMessagePopup({
  String participantName = 'Peace',
  List<MessagePopupItem>? initialMessages,
  VoidCallback? onContinue,
}) {
  return Get.dialog<void>(
    MessagePopup(
      participantName: participantName,
      initialMessages: initialMessages,
      onContinue: onContinue,
    ),
    barrierDismissible: true,
    barrierColor: const Color(0xCC000000),
  );
}

class MessagePopup extends StatefulWidget {
  const MessagePopup({
    super.key,
    required this.participantName,
    this.initialMessages,
    this.onContinue,
  });

  final String participantName;
  final List<MessagePopupItem>? initialMessages;
  final VoidCallback? onContinue;

  @override
  State<MessagePopup> createState() => _MessagePopupState();
}

class _MessagePopupState extends State<MessagePopup> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late final List<MessagePopupItem> _messages =
      widget.initialMessages ?? _defaultMessages;

  static const List<MessagePopupItem> _defaultMessages = [
    MessagePopupItem(
      text:
          'Hello, thank you for booking a mentorship session. I\'m looking forward to our conversation.',
      isFromMentor: true,
      time: '12:26 PM',
    ),
    MessagePopupItem(
      text: 'Hi Peace,',
      isFromMentor: false,
      showAvatar: true,
    ),
    MessagePopupItem(
      text:
          'Thank you for confirming. I\'m really looking forward to getting some guidance.',
      isFromMentor: false,
      showAvatar: true,
      time: '12:27 PM',
    ),
    MessagePopupItem(
      text:
          'Great. I see that you selected communication in relationships as the topic.',
      isFromMentor: true,
    ),
    MessagePopupItem(
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
        MessagePopupItem(
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
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Center(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              constraints: const BoxConstraints(maxWidth: 390, maxHeight: 600),
              decoration: BoxDecoration(
                color: const Color(0xFF111111),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.spacing14,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: Text(
                      widget.participantName,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleLarge.copyWith(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(
                        AppDimens.spacing20,
                        AppDimens.spacing20,
                        AppDimens.spacing20,
                        AppDimens.spacing16,
                      ),
                      itemCount: _messages.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: AppDimens.spacing14),
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
                      AppDimens.spacing20,
                      0,
                      AppDimens.spacing20,
                      AppDimens.spacing18,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.spacing16,
                        vertical: AppDimens.spacing8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(22),
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
                          const SizedBox(width: AppDimens.spacing12),
                          GestureDetector(
                            onTap: _sendMessage,
                            child: Container(
                              width: 38,
                              height: 38,
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
                                size: 18,
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
      ),
    );
  }
}

class MessagePopupItem {
  const MessagePopupItem({
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
