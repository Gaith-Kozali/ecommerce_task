class AppApi {
  static const String baseUrl = "https://fakestoreapi.com";
  static const String getToken = "$baseUrl/auth/login";
  static const String signUp = "$baseUrl/users";
  static String getUserDetails(String id) => "$baseUrl/users/$id";
}
