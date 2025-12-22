import 'package:dartz/dartz.dart';
import 'package:ecommerce_task/core/utils/failure.dart';
import 'package:ecommerce_task/features/feature_home/data/data_source/product_remote_data.dart';
import 'package:ecommerce_task/features/feature_home/domain/entities/product.dart';
import 'package:ecommerce_task/features/feature_home/domain/repositories/product_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/sevices/network_service.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductRepositoryImp({required this.productRemoteData});
  ProductRemoteData productRemoteData;
  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final List<Product> data = await productRemoteData.fetchAllProduct();
      return Right(data);
    } catch (e) {
      final failure = NetworkService.mapDioError(e);
      debugPrint(failure.toString());
      return Left(failure);
    }
  }
}
