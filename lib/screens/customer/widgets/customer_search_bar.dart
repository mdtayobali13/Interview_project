import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/controllers/customer_controller.dart';
import 'package:get/get.dart';

class CustomerSearchBar extends StatelessWidget {
  final CustomerController controller;

  const CustomerSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.instance.cardBg,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: AppColors.instance.scaffoldBg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.instance.border),
          ),
          child: TextField(
            controller: controller.searchController,
            onChanged: controller.onSearchChanged,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.instance.primaryTextColor,
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Search by customer name, phone...',
              hintStyle: TextStyle(
                color: AppColors.instance.hintText,
                fontSize: 13.5,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.instance.primaryLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.search_rounded,
                    color: AppColors.instance.primary,
                    size: 18,
                  ),
                ),
              ),
              suffixIcon: controller.searchQuery.value.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.cancel_rounded,
                        color: AppColors.instance.subTextColor,
                        size: 19,
                      ),
                      onPressed: controller.clearSearch,
                    )
                  : null,
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 11,
                horizontal: 14,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
