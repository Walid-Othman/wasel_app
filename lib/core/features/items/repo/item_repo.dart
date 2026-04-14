import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wasel_app/core/config/api_config.dart';
import 'package:wasel_app/core/services/api_services.dart';

class ItemRepo {
  ItemRepo({required this.apiService});
  final ApiService apiService;
  Future<bool> addItem({
    required String name,
    required double price,
    required String description,
    required List<File> images,
    required String category,
  }) async {
    try {
      List<MultipartFile> multipartImages = [];
      for (File image in images) {
        String fileName = image.path.split('/').last;
        multipartImages.add(
          await MultipartFile.fromFile(image.path, filename: fileName),
        );
      }
      FormData formData = FormData.fromMap({
        'title': name,
        'price': price,
        'descraption': description,
        "category": category,
        'images': multipartImages,
      });

      Response response = await apiService.post(
        path: ApiConfig.baseUrl,
        data: formData,
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      rethrow;
    }
  }
}
