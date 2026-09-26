import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';
import 'package:flutter_getx_project_template/models/customer_model.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_badges_row.dart';
import 'package:flutter_getx_project_template/screens/customer/widgets/detail_balance_card.dart';
import 'package:get/get.dart';

class DetailHeaderCard extends StatelessWidget {
  final CustomerModel customer;

  const DetailHeaderCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final name = customer.name?.trim().isNotEmpty == true
        ? customer.name!
        : 'Customer #${customer.id ?? ""}';
    final imageUrl = customer.fullImageUrl;
    final totalDue = customer.totalDue ?? 0.0;
    final isGeneral = (customer.custType?.toUpperCase() == 'G');

    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.instance.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.instance.border),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: (isGeneral
                            ? AppColors.instance.primary
                            : const Color(0xFF0D9488))
                        .withValues(alpha: 0.25),
                    blurRadius: 14,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (c, u, e) => _fallback(name, isGeneral),
                      )
                    : _fallback(name, isGeneral),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Customer Name
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.4,
              color: AppColors.instance.primaryTextColor,
            ),
          ),

          // Customer ID if available
          if (customer.id != null) ...[
            const SizedBox(height: 4),
            Text(
              'Account # ${customer.id}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.instance.subTextColor,
                letterSpacing: 0.2,
              ),
            ),
          ],

          const SizedBox(height: 10),

          // Badges Row
          DetailBadgesRow(customer: customer),

          const SizedBox(height: 14),

          // Quick Action Buttons (Call / Copy Details)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (customer.phone?.trim().isNotEmpty == true) ...[
                _buildQuickAction(
                  icon: Icons.phone_rounded,
                  label: 'Call',
                  color: AppColors.instance.primary,
                  bgColor: AppColors.instance.primaryLight,
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: customer.phone!));
                    Get.snackbar(
                      'Phone Copied',
                      '${customer.phone} copied to clipboard',
                      snackPosition: SnackPosition.bottom,
                      duration: const Duration(seconds: 2),
                      backgroundColor: AppColors.instance.primaryTextColor,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(12),
                      borderRadius: 10,
                    );
                  },
                ),
                const SizedBox(width: 12),
              ],
              _buildQuickAction(
                icon: Icons.copy_rounded,
                label: 'Copy Info',
                color: AppColors.instance.subTextColor,
                bgColor: AppColors.instance.dark100,
                onTap: () {
                  final summary =
                      'Customer: $name\nPhone: ${customer.phone ?? "N/A"}\nDue: ${customer.formattedBalance}';
                  Clipboard.setData(ClipboardData(text: summary));
                  Get.snackbar(
                    'Information Copied',
                    'Customer details copied to clipboard',
                    snackPosition: SnackPosition.bottom,
                    duration: const Duration(seconds: 2),
                    backgroundColor: AppColors.instance.primaryTextColor,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(12),
                    borderRadius: 10,
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Prominent Balance Card
          DetailBalanceCard(
            formattedBalance: customer.formattedBalance,
            isDuePositive: totalDue > 0,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fallback(String name, bool isGeneral) {
    final initial = name.trim().isNotEmpty ? name.substring(0, 1).toUpperCase() : '?';
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isGeneral
              ? [AppColors.instance.primary, AppColors.instance.accentIndigo]
              : [const Color(0xFF0D9488), const Color(0xFF059669)],
        ),
      ),
      child: Center(
        child: Text(
          initial,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
