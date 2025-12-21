import 'package:dartz/dartz.dart';
import 'package:ecommerce_task/core/utils/failure.dart';
import 'package:ecommerce_task/features/feature_auth/domain/entities/user.dart';
import '../../data/models/user_model.dart';
import '../entities/token.dart';

abstract class AuthRepository {
  Future<Either<Failure, Token>> getUserToken(String userName, String password);
  Future<Either<Failure, Unit>> signUpUser(UserModel user);
  Future<Either<Failure, User>> getUserInfo(int id);
}
