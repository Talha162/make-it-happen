import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final RxBool matchUpdates = true.obs;
  final RxBool learningCourses = true.obs;
  final RxBool mentorship = true.obs;
  final RxBool eventsHangouts = true.obs;
  final RxBool subscriptionPayments = true.obs;
  final RxBool safetyAccount = true.obs;
  final RxBool emailNotifications = true.obs;
  final RxBool systemRules = false.obs;
}
