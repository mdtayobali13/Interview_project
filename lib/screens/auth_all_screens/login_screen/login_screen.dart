import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/controllers/auth_controller.dart';
import 'package:flutter_getx_project_template/screens/auth_all_screens/login_screen/widgets/login_button_widget.dart';
import 'package:flutter_getx_project_template/screens/auth_all_screens/login_screen/widgets/login_error_banner.dart';
import 'package:flutter_getx_project_template/screens/auth_all_screens/login_screen/widgets/login_form_fields.dart';
import 'package:flutter_getx_project_template/screens/auth_all_screens/login_screen/widgets/login_header_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.instance.scaffoldBg,
      body: Stack(
        children: [
          // Background ambient soft glow circles
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.instance.primary100.withValues(alpha: 0.5),
                    AppColors.instance.primary50.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -70,
            left: -50,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.instance.blue2_100.withValues(alpha: 0.4),
                    AppColors.instance.blue2_50.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    decoration: BoxDecoration(
                      color: AppColors.instance.cardBg,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.instance.border),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F172A).withValues(alpha: 0.06),
                          blurRadius: 28,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const LoginHeaderWidget(),
                          const SizedBox(height: 24),
                          LoginErrorBanner(controller: controller),
                          LoginFormFields(controller: controller),
                          const SizedBox(height: 24),
                          LoginButtonWidget(controller: controller),
                          const SizedBox(height: 18),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.lock_rounded,
                                  size: 13,
                                  color: AppColors.instance.subTextColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Protected by 256-bit SSL encryption',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.instance.subTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
