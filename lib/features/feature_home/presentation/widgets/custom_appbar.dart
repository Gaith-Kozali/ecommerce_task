import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:ecommerce_task/features/feature_home/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/utils/screen_information.dart';
import '../controllers/cart_controller/cart_cubit.dart';

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
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final count = context.read<CartCubit>().getCount();
            return Badge(
              label: Text('$count'),
              backgroundColor: AppColor.error,
              isLabelVisible: context.read<CartCubit>().getCount() > 0,
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.background,
                ),
                onPressed: () {
                  context.push(CartPage.route);
                },
              ),
            );
          },
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
