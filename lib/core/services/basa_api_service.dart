import 'package:dio/dio.dart';

abstract interface class BasaApiService {
   Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });


  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onSendProgress, 
  });
  Future<Response> put({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
 

   Future<Response> delete({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}