import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../utils/demo_feedback.dart';
import '../widgets/app_multiline_field.dart';
import '../widgets/app_text_field.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_dropdown_field.dart';
import '../widgets/profile_scaffold.dart';

class SupportSafetyView extends StatefulWidget {
  const SupportSafetyView({super.key});

  @override
  State<SupportSafetyView> createState() => _SupportSafetyViewState();
}

class _SupportSafetyViewState extends State<SupportSafetyView> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  String _type = 'Bug';
  String _urgency = 'Medium';
  String _attachment = 'screenshot_demo.png';

  @override
  void initState() {
    super.initState();
    _title.text = 'Example: something in the app is not working as expected';
    _description.text = 'Describe what happened and what you expected to happen.';
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {
        showDemoSaved('Support request saved locally for APK review.');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.supportSafety, compact: true),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.supportSafety, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          AppTextField(label: 'Title', controller: _title, hintText: ''),
          const SizedBox(height: AppDimens.spacing12),
          ProfileDropdownField(
            label: 'Type',
            hintText: 'Select feedback type...',
            value: _type,
            items: const ['Bug', 'Feedback', 'Account', 'Safety'],
            onChanged: (value) {
              if (value == null) return;
              setState(() => _type = value);
            },
          ),
          const SizedBox(height: AppDimens.spacing12),
          ProfileDropdownField(
            label: 'Urgency Level',
            hintText: 'How important is this to you?',
            value: _urgency,
            items: const ['Low', 'Medium', 'High'],
            onChanged: (value) {
              if (value == null) return;
              setState(() => _urgency = value);
            },
          ),
          const SizedBox(height: AppDimens.spacing12),
          AppMultilineField(
            label: 'Description',
            controller: _description,
            hintText: '',
          ),
          const SizedBox(height: AppDimens.spacing12),
          Text('Attachments (Optional)', style: AppTextStyles.label),
          const SizedBox(height: AppDimens.spacing8),
          InkWell(
            onTap: () {
              setState(() {
                _attachment = _attachment == 'screenshot_demo.png'
                    ? 'recording_demo.mp4'
                    : 'screenshot_demo.png';
              });
              showDemoAction('Attachment updated', 'Demo attachment switched to $_attachment');
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: 68,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: const Icon(LucideIcons.upload, size: 14, color: AppColors.textSecondary),
                    ),
                    const SizedBox(width: AppDimens.spacing8),
                    Text(_attachment, style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


