import 'dart:math';

import 'package:ecommerce_task/core/utils/screen_information.dart';
import 'package:ecommerce_task/features/feature_home/presentation/controllers/cart_controller/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/product.dart';
import '../widgets/cart_item_card.dart';

class CartPage extends StatefulWidget {
  static const route = "/home/my-cart";
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColor.background,
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          cartCubit = BlocProvider.of<CartCubit>(context);
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: AppSpacing.pagePadding,
                  itemCount: cartCubit.getCount(),
                  separatorBuilder: (_, __) => AppSpacing.columnMedium,
                  itemBuilder: (context, index) {
                    return CartItemCard(
                      product: cartCubit.cartItems.elementAt(index),
                      cartCubit: cartCubit,
                    );
                  },
                ),
              ),

              _CartSummary(
                total: cartCubit.cartItems.fold(
                  0,
                      (sum, item) => sum + item.price,
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}

class _CartSummary extends StatelessWidget {
  final double total;

  const _CartSummary({required this.total});

  @override
  Widget build(BuildContext context) {
    final appSize = AppSize();

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 800),
      padding: AppSpacing.allLarge,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadow,
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: appSize.bodyFontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: appSize.mdHeaderFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
          AppSpacing.columnMedium,
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Checkout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
