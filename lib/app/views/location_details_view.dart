import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../utils/demo_feedback.dart';
import '../widgets/app_text_field.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_dropdown_field.dart';
import '../widgets/profile_scaffold.dart';

class LocationDetailsView extends StatefulWidget {
  const LocationDetailsView({super.key});

  @override
  State<LocationDetailsView> createState() => _LocationDetailsViewState();
}

class _LocationDetailsViewState extends State<LocationDetailsView> {
  final TextEditingController _locationController =
      TextEditingController(text: 'Street 21, House 14');
  String _country = 'United States';
  String _state = 'California';

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () {
        showDemoSaved('Location details were saved for this demo session.');
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.locationDetails, compact: true),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.locationDetails, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          ProfileDropdownField(
            label: 'Country',
            hintText: 'United States',
            value: _country,
            items: const ['United States', 'Canada', 'United Kingdom'],
            prefixIcon: LucideIcons.mapPin,
            onChanged: (value) {
              if (value == null) return;
              setState(() => _country = value);
            },
          ),
          const SizedBox(height: AppDimens.spacing12),
          ProfileDropdownField(
            label: 'State',
            hintText: 'California',
            value: _state,
            items: const ['California', 'Texas', 'Florida'],
            prefixIcon: LucideIcons.building2,
            onChanged: (value) {
              if (value == null) return;
              setState(() => _state = value);
            },
          ),
          const SizedBox(height: AppDimens.spacing12),
          AppTextField(
            label: 'Location',
            controller: _locationController,
            hintText: 'Street 21, House 14',
            prefixIcon: const Icon(LucideIcons.mapPin, size: 18),
          ),
        ],
      ),
    );
  }
}
