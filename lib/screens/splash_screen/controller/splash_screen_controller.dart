import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/routes/app_routes.dart';
import 'package:flutter_getx_project_template/services/storage_services/get_storage_services.dart';
import 'package:flutter_getx_project_template/utils/error_log.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final RxDouble animation = 0.0.obs;
  final RxDouble animation2 = 0.0.obs;

  Future<void> onInitialDataLoadScreen() async {
    try {
      Future.delayed(Durations.medium1, () {
        animation.value = 1.0;
        animation2.value = 1.0;
      });

      await Future.delayed(const Duration(milliseconds: 1200));

      final isLoggedIn = GetStorageServices.instance.isLoggedIn();
      if (isLoggedIn) {
        Get.offAllNamed(AppRoutes.customers);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    } catch (e) {
      errorLog("SplashScreenController onInitialDataLoadScreen", e);
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  void onInit() {
    super.onInit();
    onInitialDataLoadScreen();
  }
}
