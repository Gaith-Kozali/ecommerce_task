import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color.dart';

class AuthButton extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  final double? fontSize;
  final double? borderRadius;

  const AuthButton({
    required this.title,
    required this.onTap,
    this.color = AppColor.primary,
    this.fontSize,
    this.borderRadius,
    super.key,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool _hovered = false;
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed ? 0.98 : (_hovered ? 1.01 : 1.0),
          duration: Duration(milliseconds: 150),
          child: Container(
            width: AppSize().textFieldWidth,
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: widget.fontSize ?? AppSize().bodyFontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
