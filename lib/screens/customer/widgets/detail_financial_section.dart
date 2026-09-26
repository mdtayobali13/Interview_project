import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_section_card.dart';

class DetailFinancialSection extends StatelessWidget {
  final CustomerModel customer;

  const DetailFinancialSection({super.key, required this.customer});

  String _fmt(double? amount) =>
      amount == null ? '৳0.00' : '৳${amount.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    return DetailSectionCard(
      title: 'Financial Summary',
      icon: Icons.account_balance_rounded,
      iconColor: AppColors.instance.success,
      iconBg: AppColors.instance.successLight,
      items: [
        DetailInfoRow(
          label: 'Total Sales Value',
          value: _fmt(customer.totalSalesValue),
          icon: Icons.shopping_cart_outlined,
        ),
        DetailInfoRow(
          label: 'Total Collection',
          value: _fmt(customer.totalCollection),
          icon: Icons.price_check_rounded,
        ),
        DetailInfoRow(
          label: 'Total Return Value',
          value: _fmt(customer.totalSalesReturnValue),
          icon: Icons.replay_rounded,
        ),
        DetailInfoRow(
          label: 'Total Amount Back',
          value: _fmt(customer.totalAmountBack),
          icon: Icons.undo_rounded,
        ),
      ],
    );
  }
}
