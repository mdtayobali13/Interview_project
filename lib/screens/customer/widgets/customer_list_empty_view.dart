import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/controllers/customer_controller.dart';

class CustomerListEmptyView extends StatelessWidget {
  final CustomerController controller;

  const CustomerListEmptyView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isSearching = controller.searchQuery.value.isNotEmpty;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.instance.primaryLight,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.instance.primary100),
              ),
              child: Icon(
                isSearching ? Icons.person_search_rounded : Icons.people_outline_rounded,
                size: 42,
                color: AppColors.instance.primary,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              isSearching ? 'No Matching Customers' : 'No Customers Found',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                color: AppColors.instance.primaryTextColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              isSearching
                  ? 'No accounts match "${controller.searchQuery.value}".\nTry searching with a different name or phone.'
                  : 'Your customer directory is currently empty.\nNew customer records will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: AppColors.instance.subTextColor,
              ),
            ),
            const SizedBox(height: 20),
            if (isSearching)
              OutlinedButton.icon(
                onPressed: controller.clearSearch,
                icon: const Icon(Icons.clear_rounded, size: 16),
                label: const Text('Clear Search Filter'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.instance.primary,
                  side: BorderSide(color: AppColors.instance.primary200),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              )
            else
              ElevatedButton.icon(
                onPressed: () => controller.fetchInitialCustomers(),
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Refresh Accounts'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.instance.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
