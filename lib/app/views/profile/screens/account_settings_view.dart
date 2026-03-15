import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/resources/app_assets.dart';
import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_strings.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/utils/demo_feedback.dart';
import 'package:make_it_happen/app/widgets/app_text_field.dart';
import 'package:make_it_happen/app/widgets/profile_app_bar.dart';
import 'package:make_it_happen/app/widgets/profile_dropdown_field.dart';
import 'package:make_it_happen/app/widgets/profile_scaffold.dart';

class AccountSettingsView extends StatefulWidget {
  const AccountSettingsView({super.key});

  @override
  State<AccountSettingsView> createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _dob;
  String _gender = 'Male';
  bool _isPasswordObscured = true;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: 'Glahen Paul');
    _email = TextEditingController(text: 'glahenspaul@gmail.com');
    _password = TextEditingController(text: '********');
    _dob = TextEditingController(text: '12/07/2000');
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _dob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {
        showDemoSaved('Account settings were saved for this demo session.');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.accountSettings, compact: true),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.accountSettings, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing12),
          Text('Upload Picture', style: AppTextStyles.label),
          const SizedBox(height: AppDimens.spacing10),
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AppAssets.profileImage),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () => showDemoAction(
                      'Profile image',
                      'Image picker is not connected in demo mode.',
                    ),
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.screenBackground,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        LucideIcons.pencil,
                        size: 10,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimens.spacing16),
          AppTextField(
            label: 'Name',
            controller: _name,
            prefixIcon: const Icon(LucideIcons.user, size: 18),
          ),
          const SizedBox(height: AppDimens.spacing12),
          AppTextField(
            label: 'Email',
            controller: _email,
            prefixIcon: const Icon(LucideIcons.mail, size: 18),
          ),
          const SizedBox(height: AppDimens.spacing12),
          Row(
            children: [
              Text(
                'Password',
                style: AppTextStyles.label.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => _showChangePassword(context),
                child: Text(
                  'Change',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacing8),
          AppTextField(
            label: '',
            controller: _password,
            prefixIcon: const Icon(LucideIcons.lock, size: 18),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => _isPasswordObscured = !_isPasswordObscured);
              },
              icon: Icon(
                _isPasswordObscured ? LucideIcons.eyeOff : LucideIcons.eye,
                size: 18,
              ),
            ),
            obscureText: _isPasswordObscured,
          ),
          const SizedBox(height: AppDimens.spacing12),
          ProfileDropdownField(
            label: 'Gender *',
            hintText: 'Male',
            value: _gender,
            items: const ['Male', 'Female', 'Other'],
            onChanged: (value) {
              if (value == null) return;
              setState(() => _gender = value);
            },
          ),
          const SizedBox(height: AppDimens.spacing12),
          AppTextField(
            label: 'Date of Birth *',
            controller: _dob,
            prefixIcon: const Icon(LucideIcons.calendar, size: 18),
            suffixIcon: const Icon(LucideIcons.calendar, size: 18),
            readOnly: true,
            onTap: () => _pickDateOfBirth(context),
          ),
        ],
      ),
    );
  }

  void _showChangePassword(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.72),
      builder: (context) {
        final current = TextEditingController(text: '********');
        final next = TextEditingController(text: '********');
        final confirm = TextEditingController(text: '********');
        bool isCurrentObscured = true;
        bool isNewObscured = true;
        bool isConfirmObscured = true;
        return StatefulBuilder(
          builder: (context, setDialogState) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(
              horizontal: AppDimens.screenPadding,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Container(
                padding: const EdgeInsets.all(AppDimens.spacing20),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.border),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 64,
                            width: 64,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD8EDFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              LucideIcons.lock,
                              size: 28,
                              color: AppColors.primaryDark,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              LucideIcons.x,
                              color: AppColors.textPrimary,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppDimens.spacing8),
                      Text(
                        'Change Your Password',
                        style: AppTextStyles.titleLarge.copyWith(fontSize: 24),
                      ),
                      const SizedBox(height: AppDimens.spacing8),
                      Text(
                        "For your account's security, enter your current\npassword and set a new one.",
                        style: AppTextStyles.body,
                      ),
                      const SizedBox(height: AppDimens.spacing20),
                      AppTextField(
                        label: 'Current Password',
                        controller: current,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setDialogState(
                              () => isCurrentObscured = !isCurrentObscured,
                            );
                          },
                          icon: Icon(
                            isCurrentObscured
                                ? LucideIcons.eyeOff
                                : LucideIcons.eye,
                            size: 18,
                          ),
                        ),
                        obscureText: isCurrentObscured,
                      ),
                      const SizedBox(height: AppDimens.spacing16),
                      AppTextField(
                        label: 'New Password',
                        controller: next,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setDialogState(
                              () => isNewObscured = !isNewObscured,
                            );
                          },
                          icon: Icon(
                            isNewObscured
                                ? LucideIcons.eyeOff
                                : LucideIcons.eye,
                            size: 18,
                          ),
                        ),
                        obscureText: isNewObscured,
                      ),
                      const SizedBox(height: AppDimens.spacing16),
                      AppTextField(
                        label: 'Confirm Password',
                        controller: confirm,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setDialogState(
                              () => isConfirmObscured = !isConfirmObscured,
                            );
                          },
                          icon: Icon(
                            isConfirmObscured
                                ? LucideIcons.eyeOff
                                : LucideIcons.eye,
                            size: 18,
                          ),
                        ),
                        obscureText: isConfirmObscured,
                      ),
                      const SizedBox(height: AppDimens.spacing24),
                      SizedBox(
                        width: double.infinity,
                        height: AppDimens.buttonHeight,
                        child: ElevatedButton(
                          onPressed: () {
                            _password.text = next.text;
                            Get.back();
                            showDemoSaved(
                              'Password updated locally for demo mode.',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimens.buttonRadius,
                              ),
                            ),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.accent,
                                  AppColors.primaryDark,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                AppDimens.buttonRadius,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Yes, Change',
                                style: AppTextStyles.button,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacing12),
                      SizedBox(
                        width: double.infinity,
                        height: AppDimens.buttonHeight,
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimens.buttonRadius,
                              ),
                              side: const BorderSide(color: AppColors.border),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: AppTextStyles.buttonDark,
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
      },
    );
  }

  Future<void> _pickDateOfBirth(BuildContext context) async {
    DateTime initialDate = DateTime(2000, 7, 12);
    final parts = _dob.text.split('/');
    if (parts.length == 3) {
      final day = int.tryParse(parts[0]);
      final month = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);
      if (day != null && month != null && year != null) {
        initialDate = DateTime(year, month, day);
      }
    }

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primaryDark,
              surface: AppColors.surface,
              onSurface: AppColors.textPrimary,
            ),
            dialogBackgroundColor: AppColors.black,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate == null) return;

    final formattedDay = pickedDate.day.toString().padLeft(2, '0');
    final formattedMonth = pickedDate.month.toString().padLeft(2, '0');
    final formattedYear = pickedDate.year.toString();

    setState(() {
      _dob.text = '$formattedDay/$formattedMonth/$formattedYear';
    });
  }
}
