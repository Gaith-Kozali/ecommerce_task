part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

class CartInitial extends CartState {}

class AddToCartState extends CartState {}

class RemoveFromCartState extends CartState {}
