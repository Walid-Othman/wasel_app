import 'package:dio/dio.dart';
import 'package:wasel_app/core/services/basa_api_service.dart';

class ApiService implements BasaApiService {
  final Dio _dio;

  ApiService(this._dio);

  @override
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onSendProgress,
  }) async {
    return await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
    );
  }

  @override
  Future<Response> put({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> delete({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
