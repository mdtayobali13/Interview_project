import 'package:flutter_getx_project_template/routes/app_routes.dart';
import 'package:flutter_getx_project_template/routes/bindings/auth_binding.dart';
import 'package:flutter_getx_project_template/routes/bindings/customer_binding.dart';
import 'package:flutter_getx_project_template/routes/bindings/splash_screen_binding.dart';
import 'package:flutter_getx_project_template/screens/auth_all_screens/login_screen/login_screen.dart';
import 'package:flutter_getx_project_template/screens/customer/customer_details_screen.dart';
import 'package:flutter_getx_project_template/screens/customer/customer_list_screen.dart';
import 'package:flutter_getx_project_template/screens/error_screen/error_screen.dart';
import 'package:flutter_getx_project_template/screens/not_found_screen/not_found_screen.dart';
import 'package:flutter_getx_project_template/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage> appRootRoutesFile = <GetPage>[
  GetPage(
    name: '/',
    binding: SplashScreenBinding(),
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.splash,
    binding: SplashScreenBinding(),
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.login,
    binding: AuthBinding(),
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.customers,
    binding: CustomerBinding(),
    page: () => const CustomerListScreen(),
  ),
  GetPage(
    name: AppRoutes.customerDetails,
    page: () => const CustomerDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.errorScreen,
    binding: SplashScreenBinding(),
    page: () => const ErrorScreen(),
  ),
  GetPage(
    name: AppRoutes.instance.notFoundScreen,
    binding: SplashScreenBinding(),
    page: () => const NotFoundScreen(),
  ),
];
