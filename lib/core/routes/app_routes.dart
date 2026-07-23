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
import '../../screens/profile/edit_profile_screen.dart';
import '../../screens/profile/payment_methods_screen.dart';
import '../../screens/profile/add_payment_method_screen.dart';
import '../../screens/profile/driver_license_screen.dart';
import '../../screens/profile/change_password_screen.dart';
import '../../screens/profile/saved_addresses_screen.dart';
import '../../screens/legal/rental_agreement_screen.dart';
import '../../screens/legal/insurance_policy_screen.dart';
import '../../screens/legal/cancellation_policy_screen.dart';
import '../../screens/legal/driver_requirements_screen.dart';
import '../../screens/reservations/reservation_details_screen.dart';
import '../../screens/reservations/cancel_reservation_screen.dart';
import '../../screens/reservations/write_review_screen.dart';
import '../../screens/reservations/inspection/vehicle_inspection_screen.dart';
import '../../screens/reservations/inspection/inspection_summary_screen.dart';
import '../../screens/booking/extras_screen.dart';
import '../../screens/branches/branch_list_screen.dart';
import '../../screens/branches/branch_detail_screen.dart';
import '../../screens/transactions/transaction_history_screen.dart';
import '../../screens/transactions/invoice_detail_screen.dart';
import '../../models/vehicle_model.dart' as vehicle_model;
import '../../models/booking_model.dart' as booking_model;
import '../../models/branch_model.dart' as branch_model;
import '../../models/transaction_model.dart' as transaction_model;

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
  static const String editProfile = '/edit-profile';
  static const String paymentMethods = '/payment-methods';
  static const String addPaymentMethod = '/add-payment-method';
  static const String driverLicense = '/profile/license';
  static const String changePassword = '/change-password';
  static const String savedAddresses = '/saved-addresses';
  static const String rentalAgreement = '/rental-agreement';
  static const String insurancePolicy = '/insurance-policy';
  static const String cancellationPolicy = '/cancellation-policy';
  static const String driverRequirements = '/driver-requirements';
  static const String reservationDetails = '/reservation-details';
  static const String cancelReservation = '/cancel-reservation';
  static const String writeReview = '/write-review';
  static const String extras = '/extras';
  static const String branchList = '/branch-list';
  static const String branchDetail = '/branch-detail';
  static const String transactionHistory = '/transaction-history';
  static const String invoiceDetail = '/invoice-detail';
  static const String vehicleInspection = '/inspection';
  static const String inspectionSummary = '/inspection-summary';

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
      GoRoute(
        path: cancelReservation,
        builder: (context, state) {
          final booking = state.extra as booking_model.Booking;
          return CancelReservationScreen(booking: booking);
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
        path: writeReview,
        builder: (context, state) {
          final booking = state.extra as booking_model.Booking;
          return WriteReviewScreen(booking: booking);
        },
      ),
      GoRoute(
        path: extras,
        builder: (context, state) {
          final vehicle = state.extra as vehicle_model.Vehicle;
          return ExtrasScreen(vehicle: vehicle);
        },
      ),
      GoRoute(
        path: branchList,
        builder: (context, state) => const BranchListScreen(),
      ),
      GoRoute(
        path: branchDetail,
        builder: (context, state) {
          final branch = state.extra as branch_model.Branch;
          return BranchDetailScreen(branch: branch);
        },
      ),
      GoRoute(
        path: transactionHistory,
        builder: (context, state) => const TransactionHistoryScreen(),
      ),
      GoRoute(
        path: invoiceDetail,
        builder: (context, state) {
          final transaction = state.extra as transaction_model.Transaction;
          return InvoiceDetailScreen(transaction: transaction);
        },
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: paymentMethods,
        builder: (context, state) => const PaymentMethodsScreen(),
      ),
      GoRoute(
        path: addPaymentMethod,
        builder: (context, state) => const AddPaymentMethodScreen(),
      ),
      GoRoute(
        path: driverLicense,
        builder: (context, state) => const DriverLicenseScreen(),
      ),
      GoRoute(
        path: changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: savedAddresses,
        builder: (context, state) => const SavedAddressesScreen(),
      ),
      GoRoute(
        path: rentalAgreement,
        builder: (context, state) => const RentalAgreementScreen(),
      ),
      GoRoute(
        path: insurancePolicy,
        builder: (context, state) => const InsurancePolicyScreen(),
      ),
      GoRoute(
        path: cancellationPolicy,
        builder: (context, state) => const CancellationPolicyScreen(),
      ),
      GoRoute(
        path: driverRequirements,
        builder: (context, state) => const DriverRequirementsScreen(),
      ),
      GoRoute(
        path: vehicleInspection,
        builder: (context, state) {
          final isReturn = state.extra as bool? ?? false;
          return VehicleInspectionScreen(isReturn: isReturn);
        },
      ),
      GoRoute(
        path: inspectionSummary,
        builder: (context, state) {
          final isReturn = state.extra as bool? ?? false;
          return InspectionSummaryScreen(isReturn: isReturn);
        },
      ),
    ],
  );
}
