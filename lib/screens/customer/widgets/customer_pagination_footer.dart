import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/controllers/customer_controller.dart';

class CustomerPaginationFooter extends StatelessWidget {
  final CustomerController controller;

  const CustomerPaginationFooter({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.isPaginating.value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.instance.primary,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Loading more customers...',
                style: TextStyle(
                  color: AppColors.instance.subTextColor,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (controller.hasPaginationError.value) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.instance.errorLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.instance.error.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: AppColors.instance.error,
              size: 18,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                controller.paginationErrorMessage.value,
                style: TextStyle(
                  color: AppColors.instance.error,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: controller.retryPagination,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                foregroundColor: AppColors.instance.error,
              ),
              child: const Text(
                'Retry',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
              ),
            ),
          ],
        ),
      );
    }

    if (!controller.hasMoreData.value && controller.customers.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 1,
                color: AppColors.instance.border,
              ),
              const SizedBox(width: 8),
              Text(
                'All ${controller.customers.length} accounts loaded',
                style: TextStyle(
                  color: AppColors.instance.hintText,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 32,
                height: 1,
                color: AppColors.instance.border,
              ),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
