import 'package:flutter_getx_project_template/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends BindingsInterface {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
