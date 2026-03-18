import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/utils/demo_feedback.dart';
import 'package:make_it_happen/app/widgets/app_multiline_field.dart';
import 'package:make_it_happen/app/widgets/app_text_field.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';
import 'package:make_it_happen/app/widgets/profile_app_bar.dart';
import 'package:make_it_happen/app/widgets/profile_dropdown_field.dart';

class MatchMarriageStatusView extends StatefulWidget {
  const MatchMarriageStatusView({super.key});

  @override
  State<MatchMarriageStatusView> createState() =>
      _MatchMarriageStatusViewState();
}

class _MatchMarriageStatusViewState extends State<MatchMarriageStatusView> {
  final TextEditingController _partnerName = TextEditingController(
    text: 'Sarah J.',
  );
  final TextEditingController _message = TextEditingController(
    text: 'Share your happiness with the community',
  );
  String _status = 'Yes, we\'re married';
  String _photoName = 'marriage_photo.jpg';

  @override
  void dispose() {
    _partnerName.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.screenPadding,
              ),
              child: ProfileAppBar(title: 'Gotten Married?', compact: true),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.screenPadding,
                ),
                children: [
                  const SizedBox(height: AppDimens.spacing8),
                  Text('Gotten Married?', style: AppTextStyles.titleLarge),
                  const SizedBox(height: AppDimens.spacing20),
                  ProfileDropdownField(
                    label: 'Marriage Status',
                    hintText: 'Choose status',
                    value: _status,
                    items: const [
                      'Yes, we\'re married',
                      'Marriage is planned',
                      'Not yet',
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => _status = value);
                    },
                  ),
                  const SizedBox(height: AppDimens.spacing14),
                  AppTextField(label: 'Partner Name', controller: _partnerName),
                  const SizedBox(height: AppDimens.spacing14),
                  AppMultilineField(
                    label: 'Short Message',
                    controller: _message,
                    hintText:
                        'Share your happiness with the community (optional)',
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Upload Photo', style: AppTextStyles.label),
                  const SizedBox(height: AppDimens.spacing10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _photoName = _photoName == 'marriage_photo.jpg'
                            ? 'wedding_day.png'
                            : 'marriage_photo.jpg';
                      });
                      showDemoAction(
                        'Photo selected',
                        'Demo upload switched to $_photoName',
                      );
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: _UploadBox(photoName: _photoName),
                  ),
                  const SizedBox(height: AppDimens.spacing24),
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
                label: 'Confirm Marriage',
                isEnabled: true,
                onPressed: () => Get.toNamed(AppRoutes.matchCongratulations),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadBox extends StatelessWidget {
  const _UploadBox({required this.photoName});

  final String photoName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                LucideIcons.upload,
                size: 16,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              photoName,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
