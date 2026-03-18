import 'package:get/get.dart';
import 'package:make_it_happen/app/views/profile/screens/mentorship_session.dart';

import '../bindings/app_bindings.dart';
import '../routes/app_routes.dart';
import 'package:make_it_happen/app/views/onboarding/screens/additional_questions_view.dart';
import 'package:make_it_happen/app/views/events/screens/event_booking_confirm_view.dart';
import 'package:make_it_happen/app/views/events/screens/event_booking_success_view.dart';
import 'package:make_it_happen/app/views/events/screens/event_detail_view.dart';
import 'package:make_it_happen/app/views/events/screens/event_empty_view.dart';
import 'package:make_it_happen/app/views/events/screens/event_payment_webview.dart';
import 'package:make_it_happen/app/views/events/screens/events_view.dart';
import 'package:make_it_happen/app/views/auth/screens/forgot_password_view.dart';
import 'package:make_it_happen/app/views/onboarding/screens/intention_view.dart';
import 'package:make_it_happen/app/views/auth/screens/login_view.dart';
import 'package:make_it_happen/app/views/onboarding/screens/onboarding_basics_view.dart';
import 'package:make_it_happen/app/views/profile/screens/account_settings_view.dart';
import 'package:make_it_happen/app/views/profile/screens/active_plan_view.dart';
import 'package:make_it_happen/app/views/profile/screens/location_details_view.dart';
import 'package:make_it_happen/app/views/profile/screens/notifications_view.dart';
import 'package:make_it_happen/app/views/profile/screens/preferences_view.dart';
import 'package:make_it_happen/app/views/profile/screens/profile_view.dart';
import 'package:make_it_happen/app/views/profile/screens/relationship_view.dart';
import 'package:make_it_happen/app/views/profile/screens/terms_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_requested_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_cancelled_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_matched_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_suggestions_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_suggestions_blocked_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_search_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_detail_available_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_detail_matched_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_detail_requested_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_detail_cancelled_view.dart';
import 'package:make_it_happen/app/views/match/screens/complete_feedback_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_congratulations_view.dart';
import 'package:make_it_happen/app/views/match/screens/match_marriage_status_view.dart';
import 'package:make_it_happen/app/views/home/screens/home_view.dart';
import 'package:make_it_happen/app/views/home/screens/home_notifications_view.dart';
import 'package:make_it_happen/app/views/mentorship/screens/mentorship_guided_view.dart';
import 'package:make_it_happen/app/views/mentorship/screens/mentorship_confirmed_view.dart';
import 'package:make_it_happen/app/views/learn/screens/learn_view.dart';
import 'package:make_it_happen/app/views/learn/screens/learn_lesson_detail_view.dart';
import 'package:make_it_happen/app/views/learn/screens/learn_lesson_action_view.dart';
import 'package:make_it_happen/app/views/learn/screens/learn_video_lesson_view.dart';
import 'package:make_it_happen/app/views/auth/screens/reset_password_view.dart';
import 'package:make_it_happen/app/views/auth/screens/signup_view.dart';
import 'package:make_it_happen/app/views/auth/screens/splash_view.dart';
import 'package:make_it_happen/app/views/profile/screens/support_safety_view.dart';
import 'package:make_it_happen/app/views/auth/screens/verify_view.dart';
import 'package:make_it_happen/app/views/auth/screens/welcome_view.dart';

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
    GetPage(
      name: AppRoutes.mentorshipSessions,
      page: () => const MentorshipSessionsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.terms,
      page: () => const TermsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.events,
      page: () => const EventsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.eventEmpty,
      page: () => const EventEmptyView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.eventDetail,
      page: () => const EventDetailView(mode: EventDetailMode.available),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.eventDetailRegistered,
      page: () => const EventDetailView(mode: EventDetailMode.registered),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.eventDetailFull,
      page: () => const EventDetailView(mode: EventDetailMode.full),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.eventConfirm,
      page: () => const EventBookingConfirmView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.eventSuccess,
      page: () => const EventBookingSuccessView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.eventPayment,
      page: () => const EventPaymentWebView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchRequested,
      page: () => const MatchRequestedView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchCancelled,
      page: () => const MatchCancelledView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchMatched,
      page: () => const MatchMatchedView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchSuggestions,
      page: () => const MatchSuggestionsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchSuggestionsBlocked,
      page: () => const MatchSuggestionsBlockedView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchSearch,
      page: () => const MatchSearchView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchDetailAvailable,
      page: () => const MatchDetailAvailableView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchDetailMatched,
      page: () => const MatchDetailMatchedView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchDetailRequested,
      page: () => const MatchDetailRequestedView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchDetailCancelled,
      page: () => const MatchDetailCancelledView(),
      binding: AppBindings(),
    ),

    GetPage(
      name: AppRoutes.feedbackComplete,
      page: () => const CompleteFeedbackView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchCongratulations,
      page: () => const MatchCongratulationsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.matchMarriageStatus,
      page: () => const MatchMarriageStatusView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.homeNotifications,
      page: () => const HomeNotificationsView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.mentorshipGuided,
      page: () => const MentorshipGuidedView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.mentorshipConfirmed,
      page: () => const MentorshipConfirmedView(),
      binding: AppBindings(),
    ),
    // GetPage(
    //   name: AppRoutes.mentorshipChat,
    //   page: () => const MentorshipChatView(),
    //   binding: AppBindings(),
    // ),
    GetPage(
      name: AppRoutes.learn,
      page: () => const LearnView(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.learnDetailNotStarted,
      page: () => const LearnLessonDetailView(
        statusLabel: 'Not started',
        progress: 0.0,
        actionLabel: 'Start Lesson',
        completionLabel: null,
      ),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.learnDetailInProgress,
      page: () => const LearnLessonDetailView(
        statusLabel: 'In Progress',
        progress: 0.1,
        actionLabel: 'Resume Lesson',
        completionLabel: null,
      ),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.learnDetailCompleted,
      page: () => const LearnLessonDetailView(
        statusLabel: 'Completed',
        progress: 1.0,
        actionLabel: 'Continue Learning',
        completionLabel: 'You have completed this lesson item.',
      ),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.learnVideoNotStarted,
      page: () => const LearnVideoLessonView(
        statusLabel: 'Not Started',
        progress: 0.0,
        actionLabel: 'Start Lesson',
        completionLabel: null,
      ),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.learnVideoInProgress,
      page: () => const LearnVideoLessonView(
        statusLabel: 'In Progress',
        progress: 0.1,
        actionLabel: 'Resume Lesson',
        completionLabel: null,
      ),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.learnVideoCompleted,
      page: () => const LearnVideoLessonView(
        statusLabel: 'Completed',
        progress: 1.0,
        actionLabel: 'Continue Learning',
        completionLabel: 'You have completed this lesson item.',
      ),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.learnLessonAction,
      page: () => const LearnLessonActionView(),
      binding: AppBindings(),
    ),
  ];
}
