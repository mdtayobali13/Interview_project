import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_section_card.dart';

class DetailActivitySection extends StatelessWidget {
  final CustomerModel customer;

  const DetailActivitySection({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return DetailSectionCard(
      title: 'Sales & Activity History',
      icon: Icons.history_rounded,
      iconColor: AppColors.instance.warning,
      iconBg: AppColors.instance.warningLight,
      items: [
        DetailInfoRow(
          label: 'Last Transaction',
          value: customer.lastTransactionDate,
          icon: Icons.event_available_outlined,
        ),
        DetailInfoRow(
          label: 'Last Sales Date',
          value: customer.lastSalesDate,
          icon: Icons.calendar_today_outlined,
        ),
        DetailInfoRow(
          label: 'Last Invoice No',
          value: customer.lastInvoiceNo,
          icon: Icons.receipt_rounded,
        ),
        DetailInfoRow(
          label: 'Last Sold Product',
          value: customer.lastSoldProduct,
          icon: Icons.inventory_2_outlined,
        ),
      ],
    );
  }
}
