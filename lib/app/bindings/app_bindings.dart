import 'package:get/get.dart';

import '../controllers/additional_questions_controller.dart';
import '../controllers/basics_controller.dart';
import '../controllers/forgot_password_controller.dart';
import '../controllers/intention_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/notifications_controller.dart';
import '../controllers/otp_controller.dart';
import '../controllers/profile_controller.dart';
import '../controllers/reset_password_controller.dart';
import '../controllers/signup_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/welcome_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => WelcomeController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignupController(), fenix: true);
    Get.lazyPut(() => OtpController(), fenix: true);
    Get.lazyPut(() => ForgotPasswordController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => BasicsController(), fenix: true);
    Get.lazyPut(() => IntentionController(), fenix: true);
    Get.lazyPut(() => AdditionalQuestionsController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => NotificationsController(), fenix: true);
  }
}
