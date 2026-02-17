import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../widgets/app_multiline_field.dart';
import '../widgets/app_text_field.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_dropdown_field.dart';
import '../widgets/profile_scaffold.dart';

class SupportSafetyView extends StatelessWidget {
  SupportSafetyView({super.key});

  final TextEditingController _title =
      TextEditingController(text: 'e.g., Genie sometimes misunderstands my task...');
  final TextEditingController _description =
      TextEditingController(text: 'Tell us what happened, how you expected it...');

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.supportSafety,compact: true,),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.supportSafety, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          AppTextField(label: 'Title', controller: _title, hintText: ''),
          const SizedBox(height: AppDimens.spacing12),
          ProfileDropdownField(
            label: 'Type',
            hintText: 'Select feedback type...',
            value: '',
            items: const ['Bug', 'Feedback', 'Account', 'Safety'],
            onChanged: (_) {},
          ),
          const SizedBox(height: AppDimens.spacing12),
          ProfileDropdownField(
            label: 'Urgency Level',
            hintText: 'How important is this to you?',
            value: '',
            items: const ['Low', 'Medium', 'High'],
            onChanged: (_) {},
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
          Container(
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
                  Text('Drop image or click to add', style: AppTextStyles.bodySmall),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
