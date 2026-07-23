import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/register_screen.dart';
import '../../screens/auth/forgot_password_screen.dart';
import '../../screens/main_shell.dart';
import '../../screens/vehicle/vehicle_details_screen.dart';
import '../../screens/booking/booking_date_screen.dart';
import '../../screens/booking/booking_summary_screen.dart';
import '../../screens/booking/booking_success_screen.dart';
import '../../screens/favorites/favorites_screen.dart';
import '../../screens/notifications/notifications_screen.dart';
import '../../screens/reviews/reviews_screen.dart';
import '../../screens/profile/settings_screen.dart';
import '../../screens/profile/legal_screen.dart';
import '../../screens/profile/rewards_screen.dart';
import '../../screens/support/support_screen.dart';
import '../../screens/support/chat_screen.dart';
import '../../screens/reservations/reservation_details_screen.dart';
import '../../models/vehicle_model.dart' as vehicle_model;
import '../../models/booking_model.dart' as booking_model;

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String vehicleDetails = '/vehicle-details';
  static const String bookingDate = '/booking-date';
  static const String bookingSummary = '/booking-summary';
  static const String bookingSuccess = '/booking-success';
  static const String favorites = '/favorites';
  static const String notifications = '/notifications';
  static const String reviews = '/reviews';
  static const String settings = '/settings';
  static const String legal = '/legal';
  static const String rewards = '/rewards';
  static const String support = '/support';
  static const String chat = '/chat';
  static const String reservationDetails = '/reservation-details';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const MainShell(),
      ),
      GoRoute(
        path: '/vehicle-details',
        builder: (context, state) {
          final vehicle = state.extra as vehicle_model.Vehicle;
          return VehicleDetailsScreen(vehicle: vehicle);
        },
      ),
      GoRoute(
        path: bookingDate,
        builder: (context, state) {
          final vehicle = state.extra as vehicle_model.Vehicle;
          return BookingDateScreen(vehicle: vehicle);
        },
      ),
      GoRoute(
        path: bookingSummary,
        builder: (context, state) {
          final vehicle = state.extra as vehicle_model.Vehicle;
          return BookingSummaryScreen(vehicle: vehicle);
        },
      ),
      GoRoute(
        path: bookingSuccess,
        builder: (context, state) {
          final vehicle = state.extra as vehicle_model.Vehicle;
          return BookingSuccessScreen(vehicle: vehicle);
        },
      ),
      GoRoute(
        path: favorites,
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: reviews,
        builder: (context, state) {
          final vehicle = state.extra as vehicle_model.Vehicle;
          return ReviewsScreen(vehicle: vehicle);
        },
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: legal,
        builder: (context, state) => const LegalScreen(),
      ),
      GoRoute(
        path: rewards,
        builder: (context, state) => const RewardsScreen(),
      ),
      GoRoute(
        path: support,
        builder: (context, state) => const SupportScreen(),
      ),
      GoRoute(
        path: chat,
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: reservationDetails,
        builder: (context, state) {
          final booking = state.extra as booking_model.Booking;
          return ReservationDetailsScreen(booking: booking);
        },
      ),
    ],
  );
}
