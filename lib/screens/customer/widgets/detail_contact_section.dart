import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_section_card.dart';

class DetailContactSection extends StatelessWidget {
  final CustomerModel customer;

  const DetailContactSection({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return DetailSectionCard(
      title: 'Contact Information',
      icon: Icons.contact_phone_rounded,
      iconColor: AppColors.instance.primary,
      iconBg: AppColors.instance.primaryLight,
      items: [
        DetailInfoRow(
          label: 'Phone Number',
          value: customer.phone,
          icon: Icons.phone_outlined,
        ),
        DetailInfoRow(
          label: 'Email Address',
          value: customer.email,
          icon: Icons.mail_outline_rounded,
        ),
        DetailInfoRow(
          label: 'Primary Address',
          value: customer.primaryAddress,
          icon: Icons.location_on_outlined,
        ),
        DetailInfoRow(
          label: 'Secondary Address',
          value: customer.secoundaryAddress,
          icon: Icons.business_outlined,
        ),
      ],
    );
  }
}
