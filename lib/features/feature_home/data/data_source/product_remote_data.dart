import 'package:ecommerce_task/core/constants/app_api.dart';
import 'package:ecommerce_task/core/sevices/network_service.dart';
import 'package:ecommerce_task/features/feature_home/data/models/product_model.dart';
import 'package:ecommerce_task/features/feature_home/domain/entities/product.dart';

class ProductRemoteData {
  ProductRemoteData(this.networkService);
  NetworkService networkService;
  Future<List<Product>> fetchAllProduct() async {
    final response = await networkService.get(AppApi.allProduct);
    List<Product> products =
        (response.data as List).
        map((e) => ProductModel.fromJson(e))
        .toList();

    return products;
  }
}
