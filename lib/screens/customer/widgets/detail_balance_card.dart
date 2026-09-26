import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';

class DetailBalanceCard extends StatelessWidget {
  final String formattedBalance;
  final bool isDuePositive;

  const DetailBalanceCard({
    super.key,
    required this.formattedBalance,
    required this.isDuePositive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDuePositive
              ? [
                  const Color(0xFFFEF2F2),
                  const Color(0xFFFEE2E2),
                ]
              : [
                  const Color(0xFFECFDF5),
                  const Color(0xFFD1FAE5),
                ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDuePositive
              ? const Color(0xFFFECACA)
              : const Color(0xFFA7F3D0),
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    isDuePositive
                        ? Icons.receipt_long_rounded
                        : Icons.verified_rounded,
                    size: 14,
                    color: isDuePositive
                        ? AppColors.instance.error
                        : AppColors.instance.success,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    isDuePositive ? 'OUTSTANDING BALANCE' : 'CURRENT STATUS',
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: isDuePositive
                          ? AppColors.instance.error
                          : AppColors.instance.success,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                formattedBalance,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                  color: isDuePositive
                      ? const Color(0xFF991B1B)
                      : const Color(0xFF065F46),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: (isDuePositive ? Colors.red : Colors.green).withValues(alpha: 0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              isDuePositive ? 'Payment Due' : 'Cleared',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: isDuePositive
                    ? AppColors.instance.error
                    : AppColors.instance.success,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
