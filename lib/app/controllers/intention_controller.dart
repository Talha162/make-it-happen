import 'package:get/get.dart';

import '../data/models/selection_option.dart';
import '../routes/app_routes.dart';

class IntentionController extends GetxController {
  final relationshipGoals = <SelectionOption>[
    const SelectionOption(label: 'Preparing for marriage'),
    const SelectionOption(label: 'Serious relationship with guidance'),
  ].obs;
  final ageRanges = ['20-30 years', '30-40 years', '40-50 years'].obs;
  final locations = ['United States', 'Canada', 'United Kingdom'].obs;
  final selectedAgeRange = ''.obs;
  final selectedLocation = ''.obs;
  final canSubmit = false.obs;

  @override
  void onInit() {
    super.onInit();
    _evaluate();
  }

  void toggleGoal(int index) {
    if (index < 0 || index >= relationshipGoals.length) {
      return;
    }
    final current = relationshipGoals[index];
    relationshipGoals[index] = current.copyWith(selected: !current.selected);
    _evaluate();
  }

  void setAgeRange(String value) {
    selectedAgeRange.value = value;
    _evaluate();
  }

  void setLocation(String value) {
    selectedLocation.value = value;
    _evaluate();
  }

  void _evaluate() {
    final hasGoal = relationshipGoals.any((goal) => goal.selected);
    final filled = hasGoal && selectedAgeRange.isNotEmpty && selectedLocation.isNotEmpty;
    canSubmit.value = filled;
  }

  void onNext() {
    if (canSubmit.value) {
      Get.toNamed(AppRoutes.additional);
    }
  }

  void onSkip() {
    Get.toNamed(AppRoutes.additional);
  }

  void onBack() {
    Get.back();
  }
}
