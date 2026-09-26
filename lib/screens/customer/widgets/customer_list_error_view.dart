import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/controllers/customer_controller.dart';

class CustomerListErrorView extends StatelessWidget {
  final CustomerController controller;

  const CustomerListErrorView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.instance.errorLight,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.instance.error.withValues(alpha: 0.2)),
              ),
              child: Icon(
                Icons.wifi_off_rounded,
                size: 40,
                color: AppColors.instance.error,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Connection Problem',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                color: AppColors.instance.primaryTextColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              controller.errorMessage.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: AppColors.instance.subTextColor,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => controller.fetchInitialCustomers(),
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.instance.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
