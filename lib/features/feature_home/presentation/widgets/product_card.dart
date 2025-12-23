import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:ecommerce_task/features/feature_home/presentation/controllers/cart_controller/cart_cubit.dart';
import 'package:ecommerce_task/features/feature_home/presentation/controllers/product_controller/product_bloc.dart';
import 'package:ecommerce_task/features/feature_home/presentation/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.appSize, required this.product});
  final AppSize appSize;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.push(ProductDetailsPage.route, extra: product);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.primary.withOpacity(0.08),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Hero(
                      tag: 'product_${product.id}',
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: product.image,
                        placeholder:
                            (context, url) => Center(
                              child: Icon(Icons.image, size: appSize.iconLarge),
                            ),
                        errorWidget:
                            (context, url, error) => Center(
                              child: Icon(Icons.error, size: appSize.iconLarge),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppSpacing.allMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.columnXSmall,
                    Text(
                      '\$ ${product.price}',
                      style: TextStyle(
                        color: AppColor.priceText,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize().bodyFontSize,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSpacing.columnSmall,
                    RatingBarIndicator(
                      rating: product.rating,
                      itemBuilder:
                          (context, index) =>
                              Icon(Icons.star_outlined, color: Colors.amber),
                      itemCount: 5,
                      itemSize: appSize.iconMedium,
                    ),
                    AppSpacing.columnMedium,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          BlocProvider.of<CartCubit>(
                            context,
                          ).addToCart(product);
                        },
                        icon: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: AppColor.secondaryText,
                          size: appSize.iconMedium,
                        ),
                        label: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: AppColor.secondaryText,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSize().slBodyFontSize,
                          ),
                          maxLines: 1,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: AppSpacing.allSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
