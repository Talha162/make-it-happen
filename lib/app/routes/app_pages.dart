import 'package:get/get.dart';

import '../bindings/app_bindings.dart';
import '../routes/app_routes.dart';
import '../views/additional_questions_view.dart';
import '../views/forgot_password_view.dart';
import '../views/intention_view.dart';
import '../views/login_view.dart';
import '../views/onboarding_basics_view.dart';
import '../views/account_settings_view.dart';
import '../views/active_plan_view.dart';
import '../views/location_details_view.dart';
import '../views/mentorship_sessions_view.dart';
import '../views/notifications_view.dart';
import '../views/preferences_view.dart';
import '../views/profile_view.dart';
import '../views/relationship_view.dart';
import '../views/reset_password_view.dart';
import '../views/signup_view.dart';
import '../views/splash_view.dart';
import '../views/support_safety_view.dart';
import '../views/verify_view.dart';
import '../views/welcome_view.dart';

class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.verify,
      page: () => const VerifyView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.basics,
      page: () => const OnboardingBasicsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.intention,
      page: () => const IntentionView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.additional,
      page: () => const AdditionalQuestionsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.locationDetails,
      page: () => LocationDetailsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.mentorshipSessions,
      page: () => const MentorshipSessionsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.accountSettings,
      page: () => AccountSettingsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.supportSafety,
      page: () => SupportSafetyView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.relationship,
      page: () => const RelationshipView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.activePlan,
      page: () => const ActivePlanView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.preferences,
      page: () => const PreferencesView(),
      binding: AppBindings(),
    ),
  ];
}
