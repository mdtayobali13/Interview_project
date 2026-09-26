import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:get/get.dart';

class DetailSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> items;
  final Color? iconColor;
  final Color? iconBg;

  const DetailSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
    this.iconColor,
    this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? AppColors.instance.primary;
    final effectiveIconBg = iconBg ?? AppColors.instance.primaryLight;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.instance.cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.instance.border),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: effectiveIconBg,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(icon, size: 16, color: effectiveIconColor),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.2,
                  color: AppColors.instance.primaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: AppColors.instance.borderLight),
          const SizedBox(height: 8),
          ...items,
        ],
      ),
    );
  }
}

class DetailInfoRow extends StatelessWidget {
  final String label;
  final String? value;
  final IconData icon;
  final bool enableCopy;

  const DetailInfoRow({
    super.key,
    required this.label,
    this.value,
    required this.icon,
    this.enableCopy = true,
  });

  @override
  Widget build(BuildContext context) {
    final display =
        (value == null || value!.trim().isEmpty) ? 'N/A' : value!.trim();
    final isNA = display == 'N/A';

    return InkWell(
      onTap: (!isNA && enableCopy)
          ? () {
              Clipboard.setData(ClipboardData(text: display));
              Get.snackbar(
                'Copied',
                '$label copied to clipboard',
                snackPosition: SnackPosition.bottom,
                duration: const Duration(seconds: 1),
                backgroundColor: AppColors.instance.primaryTextColor,
                colorText: Colors.white,
                margin: const EdgeInsets.all(12),
                borderRadius: 10,
              );
            }
          : null,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.instance.scaffoldBg,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                icon,
                size: 13,
                color: AppColors.instance.subTextColor,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 130,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: AppColors.instance.subTextColor,
                ),
              ),
            ),
            Expanded(
              child: Text(
                display,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: isNA ? FontWeight.normal : FontWeight.w600,
                  color: isNA
                      ? AppColors.instance.hintText
                      : AppColors.instance.primaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
