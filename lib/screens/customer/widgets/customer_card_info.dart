import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/customer_balance_row.dart';

class CustomerCardInfo extends StatelessWidget {
  final CustomerModel customer;

  const CustomerCardInfo({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final name = customer.name?.trim().isNotEmpty == true
        ? customer.name!
        : 'Unnamed Customer';
    final phone = customer.phone?.trim().isNotEmpty == true
        ? customer.phone!
        : 'No phone number';
    final totalDue = customer.totalDue ?? 0.0;
    final isGeneral = (customer.custType?.toUpperCase() == 'G');
    final isInactive = customer.isInActive == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name & Type Badge
        Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                  color: AppColors.instance.primaryTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),

            // Inactive chip if applicable
            if (isInactive) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.instance.errorLight,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Inactive',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.instance.error,
                  ),
                ),
              ),
              const SizedBox(width: 5),
            ],

            // Type badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
              decoration: BoxDecoration(
                color: isGeneral
                    ? AppColors.instance.primaryLight
                    : const Color(0xFFF0FDFA),
                borderRadius: BorderRadius.circular(6),
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
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isGeneral
                          ? AppColors.instance.primary
                          : const Color(0xFF0D9488),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    customer.customerTypeDisplay,
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: isGeneral
                          ? AppColors.instance.primary
                          : const Color(0xFF0F766E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

        // Phone & Address snippet
        Row(
          children: [
            Icon(
              Icons.phone_outlined,
              size: 13,
              color: AppColors.instance.subTextColor,
            ),
            const SizedBox(width: 4),
            Text(
              phone,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.instance.subTextColor,
              ),
            ),
            if (customer.primaryAddress?.trim().isNotEmpty == true) ...[
              const SizedBox(width: 8),
              Text(
                '•',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.instance.hintText,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  customer.primaryAddress!.trim(),
                  style: TextStyle(
                    fontSize: 11.5,
                    color: AppColors.instance.hintText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),

        const SizedBox(height: 10),

        // Balance row
        CustomerBalanceRow(
          formattedBalance: customer.formattedBalance,
          isDuePositive: totalDue > 0,
        ),
      ],
    );
  }
}
