import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/routes/app_routes.dart';
import 'package:flutter_getx_project_template/services/api/api_exception.dart';
import 'package:flutter_getx_project_template/services/api/api_service.dart';
import 'package:flutter_getx_project_template/services/storage_services/get_storage_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    usernameController.clear();
    passwordController.clear();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    errorMessage.value = '';
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    try {
      final res = await ApiService.instance.login(
        userName: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (res.token != null && res.token!.isNotEmpty) {
        passwordController.clear();
        Get.snackbar(
          'Login Successful',
          'Welcome, ${res.userName ?? "Admin"}!',
          snackPosition: SnackPosition.top,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(12),
          borderRadius: 8,
          duration: const Duration(seconds: 2),
        );
        Get.offAllNamed(AppRoutes.customers);
      } else {
        errorMessage.value = 'Failed to obtain authorization token.';
        _showError(errorMessage.value);
      }
    } on ApiException catch (e) {
      errorMessage.value = e.message;
      _showError(e.message);
    } catch (_) {
      errorMessage.value = 'An unexpected error occurred. Please try again.';
      _showError(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await GetStorageServices.instance.storageClear();
    } finally {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  void _showError(String msg) {
    Get.snackbar(
      'Authentication Failed',
      msg,
      snackPosition: SnackPosition.top,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error_outline, color: Colors.white),
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
