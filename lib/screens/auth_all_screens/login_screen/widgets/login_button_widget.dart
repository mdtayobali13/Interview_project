import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatelessWidget {
  final AuthController controller;

  const LoginButtonWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loading = controller.isLoading.value;

      return Container(
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: loading
              ? LinearGradient(
                  colors: [
                    AppColors.instance.primary300,
                    AppColors.instance.primary400,
                  ],
                )
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.instance.primary,
                    AppColors.instance.primaryDark,
                  ],
                ),
          boxShadow: loading
              ? []
              : [
                  BoxShadow(
                    color: AppColors.instance.primary.withValues(alpha: 0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: loading ? null : controller.login,
            child: Center(
              child: loading
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Sign In to Account',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }
}
