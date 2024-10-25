import 'package:dio/dio.dart';

final class NetworkClient {
  NetworkClient({required Dio dio, required String baseUrl})
      : _dio = dio,
        _baseUrl = baseUrl {
    _dio.options.baseUrl = _baseUrl;

    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.sendTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
  }

  final Dio _dio;
  final String _baseUrl;

  // Get
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (_) {
      return Response(requestOptions: RequestOptions());
    }
  }

  // Post
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (_) {
      return Response(requestOptions: RequestOptions());
    }
  }
}
