import 'package:bloc/bloc.dart';
import 'package:ecommerce_task/features/feature_home/domain/repositories/product_repository.dart';
import '../../../../../core/enum.dart';
import '../../../../../core/utils/failure.dart';
import '../../../domain/entities/product.dart';
import 'package:equatable/equatable.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<FetchAllProduct>((event, emit) async {
      emit(ProductState(statusAPI: StatusAPI.loading));
      final data = await productRepository.getAllProduct();
      data.fold(
        (l) => emit(ProductState(statusAPI: StatusAPI.error, failure: l)),
        (r) => emit(ProductState(statusAPI: StatusAPI.success, products: r)),
      );
    });
  }
}
