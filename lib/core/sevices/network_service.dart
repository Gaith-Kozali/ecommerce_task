import 'package:dio/dio.dart';

import '../utils/failure.dart';

class NetworkService {
  late final Dio _dio;

  NetworkService({Map<String, dynamic>? headers}) {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: headers ?? {'Content-Type': 'application/json'},
      ),
    );
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await _dio.get<T>(path, queryParameters: query, options: options);
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await _dio.post<T>(
      path,
      data: data,
      queryParameters: query,
      options: options,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    return await _dio.put<T>(
      path,
      data: data,
      queryParameters: query,
      options: options,
    );
  }

  static Failure mapDioError(Object e) {
    String? statusCode = (e as DioException).response?.statusCode?.toString();
    String? message = e.message;
    return Failure(message: message, statusCode: statusCode);
  }
}
