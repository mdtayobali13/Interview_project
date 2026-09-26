import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';

class DetailBadgesRow extends StatelessWidget {
  final CustomerModel customer;

  const DetailBadgesRow({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final isInActive = customer.isInActive == true;
    final isGeneral = (customer.custType?.toUpperCase() == 'G');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Type Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isGeneral
                ? AppColors.instance.primaryLight
                : const Color(0xFFF0FDFA),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isGeneral
                  ? AppColors.instance.primary100
                  : const Color(0xFFCCFBF1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isGeneral
                      ? AppColors.instance.primary
                      : const Color(0xFF0D9488),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                'Type: ${customer.customerTypeDisplay}',
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: isGeneral
                      ? AppColors.instance.primary
                      : const Color(0xFF0F766E),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),

        // Active / Inactive Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isInActive
                ? AppColors.instance.errorLight
                : AppColors.instance.successLight,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isInActive
                  ? AppColors.instance.error.withValues(alpha: 0.3)
                  : AppColors.instance.success.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isInActive
                    ? Icons.pause_circle_outline_rounded
                    : Icons.check_circle_rounded,
                size: 13,
                color: isInActive
                    ? AppColors.instance.error
                    : AppColors.instance.success,
              ),
              const SizedBox(width: 4),
              Text(
                isInActive ? 'Account Inactive' : 'Account Active',
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: isInActive
                      ? AppColors.instance.error
                      : AppColors.instance.success,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
