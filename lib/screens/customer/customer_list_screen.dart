import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/controllers/auth_controller.dart';
import 'package:flutter_getx_project_template/controllers/customer_controller.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/customer_card.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/customer_list_empty_view.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/customer_list_error_view.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/customer_list_loading_view.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/customer_pagination_footer.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/customer_search_bar.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/logout_dialog.dart';
import 'package:get/get.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerController());
    final authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.instance.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.instance.cardBg,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.instance.primary,
                    AppColors.instance.primaryDark,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.account_balance_wallet_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Customers',
                  style: TextStyle(
                    color: AppColors.instance.primaryTextColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    letterSpacing: -0.3,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.totalRecordCount.value > 0
                        ? '${controller.totalRecordCount.value} total accounts'
                        : 'Customer Directory',
                    style: TextStyle(
                      color: AppColors.instance.subTextColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Refresh Button
          IconButton(
            tooltip: 'Refresh Customers',
            style: IconButton.styleFrom(
              backgroundColor: AppColors.instance.scaffoldBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: AppColors.instance.border),
              ),
            ),
            icon: Icon(
              Icons.refresh_rounded,
              color: AppColors.instance.primaryTextColor,
              size: 20,
            ),
            onPressed: controller.fetchInitialCustomers,
          ),
          const SizedBox(width: 8),

          // Logout Button
          IconButton(
            tooltip: 'Sign Out',
            style: IconButton.styleFrom(
              backgroundColor: AppColors.instance.errorLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: AppColors.instance.error.withValues(alpha: 0.2),
                ),
              ),
            ),
            icon: Icon(
              Icons.logout_rounded,
              color: AppColors.instance.error,
              size: 19,
            ),
            onPressed: () => LogoutDialog.show(context, authController),
          ),
          const SizedBox(width: 14),
        ],
      ),
      body: Column(
        children: [
          CustomerSearchBar(controller: controller),

          // Quick Metrics Strip
          _buildMetricsStrip(controller),

          // Customer List View
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const CustomerListLoadingView();
              }
              if (controller.errorMessage.isNotEmpty &&
                  controller.customers.isEmpty) {
                return CustomerListErrorView(controller: controller);
              }
              if (controller.customers.isEmpty) {
                return CustomerListEmptyView(controller: controller);
              }

              return RefreshIndicator(
                onRefresh: controller.refreshCustomers,
                color: AppColors.instance.primary,
                backgroundColor: AppColors.instance.cardBg,
                child: ListView.builder(
                  controller: controller.scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 6, bottom: 24),
                  itemCount: controller.customers.length + 1,
                  itemBuilder: (context, index) {
                    if (index < controller.customers.length) {
                      return CustomerCard(
                        customer: controller.customers[index],
                      );
                    }
                    return CustomerPaginationFooter(controller: controller);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsStrip(CustomerController controller) {
    return Obx(() {
      if (controller.isLoading.value || controller.customers.isEmpty) {
        return const SizedBox.shrink();
      }

      final totalLoaded = controller.customers.length;
      final withDue =
          controller.customers.where((c) => (c.totalDue ?? 0) > 0).length;
      final totalDueSum = controller.customers.fold<double>(
        0.0,
        (sum, item) => sum + (item.totalDue ?? 0.0),
      );

      return Container(
        margin: const EdgeInsets.fromLTRB(16, 2, 16, 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.instance.cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.instance.border),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Total Loaded Metric
            Expanded(
              child: _buildMetricItem(
                label: 'LOADED',
                value: '$totalLoaded',
                icon: Icons.people_alt_rounded,
                iconColor: AppColors.instance.primary,
                iconBg: AppColors.instance.primaryLight,
              ),
            ),
            Container(
              height: 28,
              width: 1,
              color: AppColors.instance.border,
            ),
            // Accounts with Due
            Expanded(
              child: _buildMetricItem(
                label: 'WITH DUE',
                value: '$withDue',
                icon: Icons.warning_amber_rounded,
                iconColor: AppColors.instance.warning,
                iconBg: AppColors.instance.warningLight,
              ),
            ),
            Container(
              height: 28,
              width: 1,
              color: AppColors.instance.border,
            ),
            // Total Due Sum
            Expanded(
              child: _buildMetricItem(
                label: 'TOTAL DUE',
                value: '৳${totalDueSum.toStringAsFixed(0)}',
                icon: Icons.account_balance_wallet_rounded,
                iconColor: AppColors.instance.error,
                iconBg: AppColors.instance.errorLight,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildMetricItem({
    required String label,
    required String value,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Icon(icon, size: 13, color: iconColor),
        ),
        const SizedBox(width: 7),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w700,
                color: AppColors.instance.subTextColor,
                letterSpacing: 0.4,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w800,
                color: AppColors.instance.primaryTextColor,
                letterSpacing: -0.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
