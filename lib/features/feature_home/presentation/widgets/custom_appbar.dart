import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/utils/screen_information.dart';

class CustomAppbar extends StatelessWidget {
  final AppSize appSize;
  const CustomAppbar({super.key, required this.appSize});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColor.primary,
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      pinned: false,
      title: Text(
        'E-Mart',
        style: TextStyle(
          color: AppColor.secondaryText,
          fontSize: appSize.mdHeaderFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined, color: AppColor.background),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.menu, color: AppColor.background),
          onPressed: () {
            openDrawerFunc(context);
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(getScreenWidth(context), 1),
        child: const Divider(height: 1),
      ),
    );
  }
}
