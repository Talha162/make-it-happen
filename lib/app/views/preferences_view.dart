import 'package:flutter/material.dart';

import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../utils/demo_feedback.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_dropdown_field.dart';
import '../widgets/profile_scaffold.dart';

class PreferencesView extends StatefulWidget {
  const PreferencesView({super.key});

  @override
  State<PreferencesView> createState() => _PreferencesViewState();
}

class _PreferencesViewState extends State<PreferencesView> {
  String _ageRange = '20-30 years';
  String _location = 'United States';

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {
        showDemoSaved('Preferences were saved for this demo session.');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.preferences, compact: true),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.preferences, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          ProfileDropdownField(
            label: 'Preferred Age Range *',
            hintText: '20-30 years',
            value: _ageRange,
            items: const ['20-30 years', '31-40 years', '41-50 years'],
            onChanged: (value) {
              if (value == null) return;
              setState(() => _ageRange = value);
            },
          ),
          const SizedBox(height: AppDimens.spacing12),
          ProfileDropdownField(
            label: 'Preferred Location *',
            hintText: 'United States',
            value: _location,
            items: const ['United States', 'Canada', 'United Kingdom'],
            onChanged: (value) {
              if (value == null) return;
              setState(() => _location = value);
            },
          ),
        ],
      ),
    );
  }
}


