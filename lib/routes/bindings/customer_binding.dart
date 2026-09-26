import 'package:flutter_getx_project_template/controllers/customer_controller.dart';
import 'package:get/get.dart';

class CustomerBinding extends BindingsInterface {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(() => CustomerController());
  }
}
