part of 'product_bloc.dart';


class ProductState extends Equatable {
  final StatusAPI statusAPI;
  final List<Product> products;
  final Failure? failure;

  const ProductState({
    this.statusAPI = StatusAPI.none,
    this.products = const [],
    this.failure,
  });

  ProductState copyWith({
    StatusAPI? statusAPI,
    List<Product>? products,
    Failure? failure,
  }) {
    return ProductState(
      statusAPI: statusAPI ?? this.statusAPI,
      products: products ?? this.products,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [statusAPI, products, failure];

  @override
  String toString() {
    return 'ProductState(statusAPI: $statusAPI, products: $products, failure: $failure)';
  }
}




