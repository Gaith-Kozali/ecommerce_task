class AppApi {
  static const String baseUrl = "https://fakestoreapi.com";
  static const String getToken = "$baseUrl/auth/login";
  static const String signUp = "$baseUrl/users";
  static const String allProduct = "$baseUrl/products";
  static String getUserDetails(String id) => "$baseUrl/users/$id/";
}
