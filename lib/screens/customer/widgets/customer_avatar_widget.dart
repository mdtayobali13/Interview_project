import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_project_template/constant/app_colors.dart';

class CustomerAvatarWidget extends StatelessWidget {
  final String imageUrl;
  final String? name;
  final String? custType;
  final double size;

  const CustomerAvatarWidget({
    super.key,
    required this.imageUrl,
    this.name,
    this.custType,
    this.size = 52,
  });

  List<Color> _getGradientColors() {
    final t = custType?.toUpperCase();
    if (t == 'G') {
      return [AppColors.instance.primary, AppColors.instance.accentIndigo];
    }
    if (t == 'L') {
      return [const Color(0xFF0D9488), const Color(0xFF059669)];
    }
    return [const Color(0xFF64748B), const Color(0xFF475569)];
  }

  String _getInitial() {
    if (name == null || name!.trim().isEmpty) return '?';
    return name!.trim().substring(0, 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colors = _getGradientColors();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.3),
        boxShadow: [
          BoxShadow(
            color: colors.first.withValues(alpha: 0.22),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.3),
        child: imageUrl.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.instance.primary50,
                  child: Center(
                    child: SizedBox(
                      width: size * 0.35,
                      height: size * 0.35,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.instance.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => _fallback(colors),
              )
            : _fallback(colors),
      ),
    );
  }

  Widget _fallback(List<Color> colors) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: Center(
        child: Text(
          _getInitial(),
          style: TextStyle(
            fontSize: size * 0.42,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }
}
