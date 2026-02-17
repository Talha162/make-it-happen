import 'package:flutter/material.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';

import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_dropdown_field.dart';
import '../widgets/profile_scaffold.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {},
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
            value: '20-30 years',
            items: const ['20-30 years', '31-40 years', '41-50 years'],
            onChanged: (_) {},
          ),
          const SizedBox(height: AppDimens.spacing12),
          ProfileDropdownField(
            label: 'Preferred Location *',
            hintText: 'United States',
            value: 'United States',
            items: const ['United States', 'Canada', 'United Kingdom'],
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
