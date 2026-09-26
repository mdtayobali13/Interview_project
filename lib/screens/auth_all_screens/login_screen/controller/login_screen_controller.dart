import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_project_template/routes/app_routes.dart';
import 'package:flutter_getx_project_template/utils/error_log.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void checkValidation() {
    try {
      if (formKey.currentState!.validate()) {
        Get.offAndToNamed(AppRoutes.customers);
      }
    } catch (e) {
      errorLog("checkValidation", e);
    }
  }

  void appOnClose() {
    try {
      emailTextEditingController.dispose();
      passwordTextEditingController.dispose();
    } catch (e) {
      errorLog("appOnClose", e);
    }
  }

  @override
  void onClose() {
    appOnClose();
    super.onClose();
  }
}
