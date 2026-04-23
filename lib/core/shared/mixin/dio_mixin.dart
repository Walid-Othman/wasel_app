import 'package:dio/dio.dart';
import 'package:wasel_app/core/config/api_config.dart';

mixin DioMixin {
  void setUpDio(Dio dio) {
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.baseUrl = ApiConfig.baseUrl;
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
    ));
  }
}
