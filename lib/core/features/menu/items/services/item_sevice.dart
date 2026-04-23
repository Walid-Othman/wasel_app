import 'package:dio/dio.dart';
import 'package:wasel_app/core/features/menu/items/services/base_item_service.dart';
import 'package:wasel_app/core/features/menu/model/menu_model.dart';

class ItemSevice with DioMixin implements BaseItemService {
  ItemSevice(this._dio);
  final Dio _dio;
  @override
  Future<Response> addNewItem(String baseUrl, data) async {
    try {
      final response = await _dio.post(baseUrl, data: data);
      return response.data;
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      rethrow;
    }
  }

  @override
  Future<dynamic> getItems(String baseUrl) async {
    try {
      final result = await _dio.get(baseUrl);
      return result;
    } on DioException catch (e) {
      print("Dio Error: ${e.message} ");
      rethrow;
    }
  }

  @override
  Future<bool> updateItem(String baseUrl, data) async {
    try {
      final result = await _dio.put(baseUrl, data: data);
      return result.statusCode == 200 || result.statusCode == 201;
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      rethrow;
    }
  }

  @override
  Future<bool> deleteItem(String baseUrl) async {
    try {
      final result = await _dio.delete(baseUrl);
      return result.statusCode == 200;
    } on DioException catch (e) {
      print('Dio Error: ${e.message}');
      rethrow;
    }
  }
}
