import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_section_card.dart';

class DetailAdditionalSection extends StatelessWidget {
  final CustomerModel customer;

  const DetailAdditionalSection({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return DetailSectionCard(
      title: 'Additional Details',
      icon: Icons.info_outline_rounded,
      iconColor: AppColors.instance.accentIndigo,
      iconBg: AppColors.instance.blue2_50,
      items: [
        DetailInfoRow(
          label: 'Parent Customer',
          value: customer.parentCustomer,
          icon: Icons.supervisor_account_outlined,
        ),
        DetailInfoRow(
          label: 'Client Company',
          value: customer.clinetCompanyName,
          icon: Icons.domain_outlined,
        ),
        DetailInfoRow(
          label: 'Special Notes',
          value: customer.notes,
          icon: Icons.notes_rounded,
        ),
      ],
    );
  }
}
