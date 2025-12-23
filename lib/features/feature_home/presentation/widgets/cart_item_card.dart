import 'package:ecommerce_task/features/feature_home/presentation/controllers/cart_controller/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/product.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.product,
    required this.cartCubit,
  });
  final Product product;
  final CartCubit cartCubit;
  @override
  Widget build(BuildContext context) {
    final appSize = AppSize();

    return Container(
      padding: AppSpacing.allMedium,
      decoration: BoxDecoration(
        color: AppColor.authCard,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadow,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.image,
              width: 80.r,
              height: 80.r,
              fit: BoxFit.contain,
            ),
          ),

          AppSpacing.rowMedium,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: appSize.bodyFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpacing.columnSmall,
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: appSize.bodyFontSize,
                    color: AppColor.priceText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: AppColor.error),
            onPressed: () {
              cartCubit.removeFromCart(product);
            },
          ),
        ],
      ),
    );
  }
}
