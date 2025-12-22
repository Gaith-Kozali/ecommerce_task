import 'package:dartz/dartz.dart';
import 'package:ecommerce_task/features/feature_home/domain/entities/product.dart';
import '../../../../core/utils/failure.dart';

abstract class ProductRepository{
  Future<Either<Failure, List<Product>>> getAllProduct();
}