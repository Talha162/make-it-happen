import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:make_it_happen/app/resources/app_colors.dart';
import 'package:make_it_happen/app/resources/app_dimens.dart';
import 'package:make_it_happen/app/resources/app_text_styles.dart';
import 'package:make_it_happen/app/routes/app_routes.dart';
import 'package:make_it_happen/app/widgets/primary_button.dart';

class MentorshipGuidedView extends StatefulWidget {
  const MentorshipGuidedView({super.key});

  @override
  State<MentorshipGuidedView> createState() => _MentorshipGuidedViewState();
}

class _MentorshipGuidedViewState extends State<MentorshipGuidedView> {
  static const List<String> _topics = [
    'Pre-marriage preparation',
    'Conflict resolution',
    'Family involvement',
    'Effective communication',
    'General mentorship',
  ];

  static const List<String> _sessionTypes = ['Remote', 'In Person', 'Hybrid'];

  String _selectedTopic = 'General mentorship';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = const TimeOfDay(hour: 10, minute: 0);
  String _selectedSessionType = 'Remote';

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month - 1]}, ${date.year}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime(2030, 12, 31),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              surface: AppColors.surface,
              onSurface: AppColors.textPrimary,
            ),
            dialogTheme: const DialogThemeData(
              backgroundColor: AppColors.surface,
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              surface: AppColors.surface,
              onSurface: AppColors.textPrimary,
            ),
            timePickerTheme: const TimePickerThemeData(
              backgroundColor: AppColors.surface,
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  Future<void> _pickSessionType() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.spacing8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _sessionTypes.map((type) {
                return ListTile(
                  title: Text(
                    type,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  trailing: type == _selectedSessionType
                      ? const Icon(Icons.check, color: AppColors.primary)
                      : null,
                  onTap: () => Navigator.of(context).pop(type),
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() => _selectedSessionType = selected);
    }
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
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.screenPadding,
                ),
                children: [
                  const SizedBox(height: AppDimens.spacing6),
                  Row(
                    children: [
                      Text(
                        'Guided Mentorship',
                        style: AppTextStyles.titleLarge,
                      ),
                      const Spacer(),
                      Text(
                        '\$40',
                        style: AppTextStyles.titleLarge.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.spacing20),
                  Text('Choose a Topic', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _topics.map((topic) {
                      final isSelected = topic == _selectedTopic;
                      return _TopicChip(
                        label: topic,
                        isSelected: isSelected,
                        showCheck: isSelected,
                        onTap: () => setState(() => _selectedTopic = topic),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: AppDimens.spacing20),
                  Text('Choose Date', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing10),
                  _Field(
                    value: _formatDate(_selectedDate),
                    trailing: const Icon(
                      LucideIcons.calendar,
                      size: 18,
                      color: AppColors.textMuted,
                    ),
                    onTap: _pickDate,
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Choose Time', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing10),
                  _Field(
                    value: _selectedTime.format(context),
                    trailing: const Icon(
                      LucideIcons.clock,
                      size: 18,
                      color: AppColors.textMuted,
                    ),
                    onTap: _pickTime,
                  ),
                  const SizedBox(height: AppDimens.spacing16),
                  Text('Session Type', style: AppTextStyles.titleMedium),
                  const SizedBox(height: AppDimens.spacing10),
                  _Field(
                    value: _selectedSessionType,
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.textMuted,
                    ),
                    onTap: _pickSessionType,
                  ),
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
                label: 'Book & Pay',
                isEnabled: true,
                onPressed: () => Get.toNamed(AppRoutes.mentorshipConfirmed),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopicChip extends StatelessWidget {
  const _TopicChip({
    required this.label,
    required this.onTap,
    this.isSelected = false,
    this.showCheck = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  final bool showCheck;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryDark : AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCheck)
              const Icon(Icons.check, size: 16, color: AppColors.white)
            else
              Icon(
                Icons.add,
                size: 16,
                color: isSelected ? AppColors.white : AppColors.textMuted,
              ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: isSelected ? AppColors.white : AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.value,
    required this.trailing,
    required this.onTap,
  });

  final String value;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
      child: Container(
        height: AppDimens.fieldHeight,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.spacing12),
        decoration: BoxDecoration(
          color: AppColors.fieldFill,
          borderRadius: BorderRadius.circular(AppDimens.fieldRadius),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
