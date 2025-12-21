import 'package:ecommerce_task/core/constants/app_color.dart';
import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class LinkButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const LinkButtonWidget({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: AppSize().bodyFontSize,
            decoration: TextDecoration.underline,
            color: AppColor.linkBlue,
            decorationColor: AppColor.linkBlue,
          ),
        ),
      ),
    );
  }
}
