import 'package:bloc/bloc.dart';
import 'package:ecommerce_task/features/feature_home/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  Set<Product> cartItems = {};
  void addToCart(Product product) {
    cartItems.add(product);
    debugPrint("\n addToCart ${cartItems.length}");
    emit(AddToCartState());
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    debugPrint("\n removeFromCart ${cartItems.length}");
    emit(RemoveFromCartState());
  }

  int getCount() {
    return cartItems.length;
  }
}
