import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalData {
  final SharedPreferences prefs;

  AuthLocalData(this.prefs);

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    await prefs.setString(_accessTokenKey, accessToken);
    if (refreshToken != null) {
      await prefs.setString(_refreshTokenKey, refreshToken);
    }
  }

  String? getAccessToken() {
    return prefs.getString(_accessTokenKey);
  }

  String? getRefreshToken() {
    return prefs.getString(_refreshTokenKey);
  }

  bool hasAccessToken() {
    return prefs.containsKey(_accessTokenKey);
  }

  Future<void> clearTokens() async {
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  }
}
