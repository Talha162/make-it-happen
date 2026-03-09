import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_styles.dart';
import '../utils/demo_feedback.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_dropdown_field.dart';
import '../widgets/profile_scaffold.dart';

class RelationshipView extends StatefulWidget {
  const RelationshipView({super.key});

  @override
  State<RelationshipView> createState() => _RelationshipViewState();
}

class _RelationshipViewState extends State<RelationshipView> {
  String _mentorship = 'Yes';
  final List<String> _goalOptions = const [
    'Preparing for marriage',
    'Serious relationship with guidance',
    'Faith-based connection',
    'Friendship first',
  ];
  String _selectedGoal = '';
  final List<String> _selectedGoals = [
    'Preparing for marriage',
    'Serious relationship with guidance',
  ];

  @override
  Widget build(BuildContext context) {
    return ProfileScaffold(
      showBottomButton: true,
      bottomLabel: AppStrings.saveDetails,
      onBottomTap: () => showDemoSaved('Relationship preferences were saved for this demo session.'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(title: AppStrings.relationship, compact: true),
          const SizedBox(height: AppDimens.spacing6),
          Text(AppStrings.relationship, style: AppTextStyles.titleLarge),
          const SizedBox(height: AppDimens.spacing16),
          ProfileDropdownField(
            label: 'Relationship Goal *',
            hintText: 'Select interests (e.g., music, hiking, coffee)',
            value: _selectedGoal,
            items: _goalOptions,
            onChanged: (value) {
              if (value == null || value.isEmpty) {
                return;
              }
              setState(() {
                _selectedGoal = value;
                if (!_selectedGoals.contains(value)) {
                  _selectedGoals.add(value);
                }
              });
            },
          ),
          const SizedBox(height: AppDimens.spacing12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _selectedGoals
                .map(
                  (goal) => _GoalChip(
                    label: goal,
                    onRemove: () {
                      setState(() {
                        _selectedGoals.remove(goal);
                        if (_selectedGoal == goal) {
                          _selectedGoal = '';
                        }
                      });
                    },
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppDimens.spacing16),
          Text('Are you open to mentorship', style: AppTextStyles.label),
          const SizedBox(height: AppDimens.spacing8),
          Row(
            children: [
              _RadioPill(
                label: 'Yes',
                selected: _mentorship == 'Yes',
                onTap: () => setState(() => _mentorship = 'Yes'),
              ),
              const SizedBox(width: AppDimens.spacing12),
              _RadioPill(
                label: 'No',
                selected: _mentorship == 'No',
                onTap: () => setState(() => _mentorship = 'No'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RadioPill extends StatelessWidget {
  const _RadioPill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: selected ? AppColors.primary : AppColors.border),
              color: selected ? AppColors.primary : AppColors.transparent,
            ),
          ),
          const SizedBox(width: 6),
          Text(label, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

class _GoalChip extends StatelessWidget {
  const _GoalChip({
    required this.label,
    required this.onRemove,
  });

  final String label;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppDimens.chipRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onRemove,
            child: const Icon(LucideIcons.x, size: 14, color: AppColors.white),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.chip,
          ),
        ],
      ),
    );
  }
}
