import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_color.dart';
import '../../domain/entities/product.dart';
import '../pages/product_details_page.dart';

List<Product> _searchFunction(search, List<Product> products) {
  if (search.isEmpty) return [];
  List<Product> result =
      products
          .where(
            (element) =>
                element.title.toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
  return result;
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.appSize,
    required this.products,
  });
  final List<Product> products;
  final AppSize appSize;
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<Product>(
      suggestionsCallback: (search) => _searchFunction(search, products),
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: 'Search products...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: AppColor.textField,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
      itemBuilder: (context, product) {
        return ListTile(
          leading: CachedNetworkImage(
            imageUrl: product.image,
            width: appSize.iconMedium,
            height: appSize.iconMedium,
            fit: BoxFit.contain,
          ),
          title: Text(
            product.title,
            maxLines: 1,
            style: TextStyle(fontSize: appSize.slBodyFontSize),
          ),
          subtitle: Text(
            "\$ ${product.price}",
            maxLines: 1,
            style: TextStyle(
              color: AppColor.priceText,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      onSelected: (product) {
        context.push(ProductDetailsPage.route, extra: product);
      },
    );
  }
}
