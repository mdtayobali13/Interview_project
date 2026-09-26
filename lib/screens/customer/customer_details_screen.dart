import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_activity_section.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_additional_section.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_contact_section.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_financial_section.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_header_card.dart';
import 'package:get/get.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerModel? customer = Get.arguments as CustomerModel?;

    if (customer == null) {
      return Scaffold(
        backgroundColor: AppColors.instance.scaffoldBg,
        appBar: AppBar(title: const Text('Customer Details')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_off_rounded,
                size: 48,
                color: AppColors.instance.hintText,
              ),
              const SizedBox(height: 12),
              Text(
                'No Customer Information Found',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.instance.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.instance.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.instance.cardBg,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        leading: IconButton(
          tooltip: 'Back',
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.instance.primaryTextColor,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Customer Profile',
          style: TextStyle(
            color: AppColors.instance.primaryTextColor,
            fontWeight: FontWeight.w800,
            fontSize: 18,
            letterSpacing: -0.3,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Copy Profile Summary',
            icon: Icon(
              Icons.share_outlined,
              color: AppColors.instance.primaryTextColor,
              size: 20,
            ),
            onPressed: () {
              final summary =
                  'Name: ${customer.name ?? "N/A"}\n'
                  'Phone: ${customer.phone ?? "N/A"}\n'
                  'Due: ${customer.formattedBalance}\n'
                  'Address: ${customer.primaryAddress ?? "N/A"}';
              Clipboard.setData(ClipboardData(text: summary));
              Get.snackbar(
                'Profile Shared',
                'Customer summary copied to clipboard',
                snackPosition: SnackPosition.bottom,
                duration: const Duration(seconds: 2),
                backgroundColor: AppColors.instance.primaryTextColor,
                colorText: Colors.white,
                margin: const EdgeInsets.all(12),
                borderRadius: 10,
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DetailHeaderCard(customer: customer),
            DetailContactSection(customer: customer),
            DetailFinancialSection(customer: customer),
            DetailActivitySection(customer: customer),
            DetailAdditionalSection(customer: customer),
          ],
        ),
      ),
    );
  }
}
