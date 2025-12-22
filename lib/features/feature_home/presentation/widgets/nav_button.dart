import 'package:ecommerce_task/core/constants/app_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';

Widget navButton({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
  Color? iconColor,
}) {
  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.background.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor ?? AppColor.background),
          AppSpacing.rowSmall,
          Text(
            label,
            style: TextStyle(
              color: AppColor.background,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}