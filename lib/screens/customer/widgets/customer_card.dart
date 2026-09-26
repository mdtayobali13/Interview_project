import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/routes/app_routes.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/customer_avatar_widget.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/customer_card_info.dart';
import 'package:get/get.dart';

class CustomerCard extends StatelessWidget {
  final CustomerModel customer;

  const CustomerCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.instance.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.instance.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => Get.toNamed(AppRoutes.customerDetails, arguments: customer),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerAvatarWidget(
                  imageUrl: customer.fullImageUrl,
                  name: customer.name,
                  custType: customer.custType,
                  size: 50,
                ),
                const SizedBox(width: 13),
                Expanded(child: CustomerCardInfo(customer: customer)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
