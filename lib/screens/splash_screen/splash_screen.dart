import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/screens/splash_screen/controller/splash_screen_controller.dart';
import 'package:flutter_getx_project_template/utils/app_size.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;
    final controller = Get.put(SplashScreenController());

    return Scaffold(
      backgroundColor: AppColors.instance.scaffoldBg,
      body: Stack(
        children: [
          // Background ambient soft glow circles
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.instance.primary100.withValues(alpha: 0.6),
                    AppColors.instance.primary50.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -60,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.instance.blue2_100.withValues(alpha: 0.5),
                    AppColors.instance.blue2_50.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          // Main Center Content
          Center(
            child: Obx(
              () => AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
                opacity: controller.animation.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Brand Icon Container
                    Container(
                      height: 84,
                      width: 84,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.instance.primary,
                            AppColors.instance.primaryDark,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.instance.primary.withValues(alpha: 0.35),
                            blurRadius: 28,
                            spreadRadius: 2,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.account_balance_wallet_rounded,
                          size: 44,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),

                    // App Title
                    Text(
                      'HisabPlus',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                        color: AppColors.instance.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Subtitle Tag Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.instance.primaryLight,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.instance.primary100),
                      ),
                      child: Text(
                        'SMART CUSTOMER ACCOUNTING',
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: AppColors.instance.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Loading indicator
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.instance.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Version Badge
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified_user_rounded,
                    size: 13,
                    color: AppColors.instance.subTextColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Bank-Grade Security • v1.0.0',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.instance.subTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
