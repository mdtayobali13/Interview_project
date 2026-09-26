class AppRoutes {
  AppRoutes._privateConstructor();
  static final AppRoutes _instance = AppRoutes._privateConstructor();
  static AppRoutes get instance => _instance;

  static const String splash = '/splash';
  static const String login = '/login';
  static const String customers = '/customers';
  static const String customerDetails = '/customer-details';

  final String initial = "/splash";
  final String splashScreen = "/splash";
  final String loginScreen = "/login";
  final String customersScreen = "/customers";
  final String customerDetailsScreen = "/customer-details";
  final String errorScreen = '/errorScreen';
  final String notFoundScreen = "/notFoundScreen";
  final String wellCome = "/wellCome";
  final String otpVerificationScreen = "/otp-verification";
  final String forgotScreen = "/forgot-screen";
  final String signUpScreen = "/signup-screen";
  final String changePasswordScreen = "/change-password-screen";
  final String appNavigationScreen = "/customers";
  final String termsAndConditions = "/terms-and-conditions";
  final String privacyPolicy = "/privacy-policy";
  final String aboutUs = "/about-us";
}
