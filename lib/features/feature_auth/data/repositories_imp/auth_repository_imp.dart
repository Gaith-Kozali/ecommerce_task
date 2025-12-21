import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_task/core/utils/failure.dart';
import 'package:ecommerce_task/core/sevices/network_service.dart';
import 'package:ecommerce_task/features/feature_auth/data/models/user_model.dart';
import 'package:ecommerce_task/features/feature_auth/domain/entities/token.dart';
import 'package:ecommerce_task/features/feature_auth/domain/entities/user.dart';
import 'package:ecommerce_task/features/feature_auth/domain/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

import '../data_source/auth_remote_data.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRemoteData authRemoteData;
  AuthRepositoryImp({required this.authRemoteData});
  @override
  Future<Either<Failure, User>> getUserInfo(int id) async {
    try {
      final User data = await authRemoteData.getUserInf(id.toString());
      return Right(data);
    } catch (e) {
      final failure = NetworkService.mapDioError(e);
      debugPrint(failure.toString());
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, Token>> getUserToken(
    String userName,
    String password,
  ) async {
    try {
      Token token = await authRemoteData.getToken(userName, password);
      return Right(token);
    } catch (e) {
      final failure = NetworkService.mapDioError(e);
      debugPrint(failure.toString());
      return Left(failure);
    }
  }

  // fake signup because Api learn
  @override
  Future<Either<Failure, Unit>> signUpUser(UserModel user) async {
    try {
      await authRemoteData.signUp(user);
      return Right(unit);
    } catch (e) {
      final failure = NetworkService.mapDioError(e);
      debugPrint(failure.toString());
      return Left(failure);
    }
  }
}
