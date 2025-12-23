import 'package:ecommerce_task/core/constants/app_api.dart';
import 'package:ecommerce_task/core/sevices/network_service.dart';
import 'package:ecommerce_task/features/feature_auth/data/models/token_model.dart';
import 'package:ecommerce_task/features/feature_auth/data/models/user_model.dart';

import '../../domain/entities/token.dart';
import '../../domain/entities/user.dart';

class AuthRemoteData {
  AuthRemoteData(this.networkService);
  NetworkService networkService;

  Future<Token> getToken(String userName, String password) async {
    final response = await networkService.post(
      AppApi.getToken,
      data: {"username": userName, "password": password},
    );
    return TokenModel.fromJson(response.data);
  }

  Future<void> signUp(UserModel userModel) async {
    await networkService.post(AppApi.signUp, data: userModel.toJson());
  }

  Future<User> getUserInf({String id = "1"}) async {
    final response = await networkService.get(AppApi.getUserDetails(id));
    return UserModel.fromJson(response.data);
  }
}
