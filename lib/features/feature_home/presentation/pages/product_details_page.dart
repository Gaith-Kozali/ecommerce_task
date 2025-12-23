import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_task/core/constants/app_spacing.dart';
import 'package:ecommerce_task/core/utils/screen_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../domain/entities/product.dart';

class ProductDetailsPage extends StatelessWidget {
  static const route = '/home/product-details';
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final AppSize appSize = AppSize();
    return SafeArea(child: Scaffold(
      backgroundColor: AppColor.background,
      body: Stack(
        children: [
          Container(
            height: getScreenHeight(context),
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(0.2),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 350),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.r),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Hero(
                            tag: 'product_${product.id}',
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
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
                  ),
                  SizedBox(height: 24.h),

                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
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
                        Text(
                          product.title,
                          style: TextStyle(
                            fontSize: appSize.mdHeaderFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryText,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            color: AppColor.priceText,
                            fontWeight: FontWeight.bold,
                            fontSize: appSize.bodyFontSize,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: product.rating,
                              itemBuilder:
                                  (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: appSize.iconMedium,
                            ),
                            AppSpacing.rowSmall,
                            Text(
                              '(${product.ratingCount} reviews)',
                              style: TextStyle(
                                fontSize: appSize.slBodyFontSize,
                                color: AppColor.primaryText,
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.columnMedium,

                        Text(
                          'Category: ${product.category}',
                          style: TextStyle(
                            fontSize: appSize.slBodyFontSize,
                            fontStyle: FontStyle.italic,
                            color: AppColor.primaryText,
                          ),
                        ),
                        AppSpacing.columnMedium,
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: appSize.bodyFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryText,
                          ),
                        ),
                        AppSpacing.columnSmall,
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: appSize.bodyFontSize,
                            color: AppColor.primaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

// double _imageWidth(BuildContext context) {
//   final width = getScreenWidth(context);
//
//   if (AppBreakpoints.isDesktop(width)) {
//     return width * 0.5;
//   } else if (AppBreakpoints.isTablet(width)) {
//     return width * 0.6;
//   } else {
//     return width * 0.9;
//   }
// }
