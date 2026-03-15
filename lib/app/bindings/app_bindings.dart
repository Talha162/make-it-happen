import 'package:get/get.dart';

import 'package:make_it_happen/app/controllers/onboarding/additional_questions_controller.dart';
import 'package:make_it_happen/app/controllers/onboarding/basics_controller.dart';
import 'package:make_it_happen/app/controllers/auth/forgot_password_controller.dart';
import 'package:make_it_happen/app/controllers/onboarding/intention_controller.dart';
import 'package:make_it_happen/app/controllers/auth/login_controller.dart';
import 'package:make_it_happen/app/controllers/profile/notifications_controller.dart';
import 'package:make_it_happen/app/controllers/auth/otp_controller.dart';
import 'package:make_it_happen/app/controllers/profile/profile_controller.dart';
import 'package:make_it_happen/app/controllers/auth/reset_password_controller.dart';
import 'package:make_it_happen/app/controllers/auth/signup_controller.dart';
import 'package:make_it_happen/app/controllers/auth/splash_controller.dart';
import 'package:make_it_happen/app/controllers/auth/welcome_controller.dart';

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
