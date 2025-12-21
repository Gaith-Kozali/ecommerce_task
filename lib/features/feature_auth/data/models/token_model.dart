import '../../domain/entities/token.dart';

class TokenModel extends Token {
  TokenModel({required super.accessToken, super.refreshToken});
  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(accessToken: json['token'], refreshToken: null);
  }
}
