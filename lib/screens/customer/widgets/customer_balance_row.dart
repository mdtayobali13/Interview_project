import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';

class CustomerBalanceRow extends StatelessWidget {
  final String formattedBalance;
  final bool isDuePositive;

  const CustomerBalanceRow({
    super.key,
    required this.formattedBalance,
    required this.isDuePositive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.5),
          decoration: BoxDecoration(
            color: isDuePositive
                ? AppColors.instance.errorLight
                : AppColors.instance.successLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDuePositive
                  ? AppColors.instance.error.withValues(alpha: 0.25)
                  : AppColors.instance.success.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isDuePositive
                    ? Icons.account_balance_wallet_outlined
                    : Icons.check_circle_outline_rounded,
                size: 13,
                color: isDuePositive
                    ? AppColors.instance.error
                    : AppColors.instance.success,
              ),
              const SizedBox(width: 5),
              Text(
                'Due: ',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isDuePositive
                      ? AppColors.instance.error
                      : AppColors.instance.success,
                ),
              ),
              Text(
                formattedBalance,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: isDuePositive
                      ? AppColors.instance.error
                      : AppColors.instance.success,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),

        // Action Chevron circle
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: AppColors.instance.dark100.withValues(alpha: 0.7),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: AppColors.instance.subTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
