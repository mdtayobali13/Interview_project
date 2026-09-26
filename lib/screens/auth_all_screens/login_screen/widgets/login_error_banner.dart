import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginErrorBanner extends StatelessWidget {
  final AuthController controller;

  const LoginErrorBanner({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.errorMessage.isEmpty) return const SizedBox.shrink();
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.instance.errorLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.instance.error.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: AppColors.instance.error,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                controller.errorMessage.value,
                style: TextStyle(
                  color: AppColors.instance.error,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
