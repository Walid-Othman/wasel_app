import 'package:dio/dio.dart';
import 'package:wasel_app/core/config/api_config.dart';
import 'package:wasel_app/core/features/reviews/model/user_review_model.dart';

class DioPackage {
  // Singleton Instance
  static final DioPackage _instance = DioPackage._();
  late Dio dio;

  factory DioPackage() {
    return _instance;
  }

  DioPackage._() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  // --- GET ---
  Future<dynamic> get(String subBase) async {
    try {
      final response = await dio.get(subBase);
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to GET data: ${e.message}');
    }
  }

  // --- POST ---
  Future<dynamic> create(String subBase, {UserReviewModel? data}) async {
    try {
      final response = await dio.post(subBase, data: data?.toJson());
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to POST data: ${e.message}');
    }
  }

  // --- PUT (Update) ---
  Future<dynamic> update(String subBase, {UserReviewModel? data}) async {
    try {
      final response = await dio.put(subBase, data: data?.toJson());
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to PUT data: ${e.message}');
    }
  }

  // --- DELETE ---
  Future<bool> delete(String subBase, {Object? data}) async {
    try {
      await dio.delete(subBase, data: data);
      return true;
    } on DioException catch (e) {
      throw Exception('Failed to DELETE data: ${e.message}');
    }
  }
}
