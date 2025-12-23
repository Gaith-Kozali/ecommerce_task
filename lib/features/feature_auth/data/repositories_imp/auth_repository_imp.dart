import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_task/core/utils/failure.dart';
import 'package:ecommerce_task/core/sevices/network_service.dart';
import 'package:ecommerce_task/features/feature_auth/data/data_source/auth_local_data.dart';
import 'package:ecommerce_task/features/feature_auth/data/models/user_model.dart';
import 'package:ecommerce_task/features/feature_auth/domain/entities/token.dart';
import 'package:ecommerce_task/features/feature_auth/domain/entities/user.dart';
import 'package:ecommerce_task/features/feature_auth/domain/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

import '../data_source/auth_remote_data.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRemoteData authRemoteData;
  AuthLocalData authLocalData;
  AuthRepositoryImp({
    required this.authRemoteData,
    required this.authLocalData,
  });

  @override
  Future<Either<Failure, User>> getUserToken(
    String userName,
    String password,
  ) async {
    try {
      Token token = await authRemoteData.getToken(userName, password);
      User user = await authRemoteData.getUserInf();
      await authLocalData.saveTokens(
        accessToken: token.accessToken,
        refreshToken: token.refreshToken,
      );
      return Right(user);
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

  @override
  Future<Either<Failure, User>> getUserInfo({int id = 1}) async {
    try {
      final User data = await authRemoteData.getUserInf(id: id.toString());
      return Right(data);
    } catch (e) {
      final failure = NetworkService.mapDioError(e);
      debugPrint(failure.toString());
      return Left(failure);
    }
  }

  @override
  bool getLoginStatus() {
    return authLocalData.hasAccessToken();
  }
}
