import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.instance.primary,
                AppColors.instance.primaryDark,
              ],
            ),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: AppColors.instance.primary.withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.account_balance_wallet_rounded,
              size: 38,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Welcome to HisabPlus',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            color: AppColors.instance.primaryTextColor,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Sign in to manage your customer accounts & ledger',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.instance.subTextColor,
          ),
        ),
      ],
    );
  }
}
