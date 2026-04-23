import 'package:dio/dio.dart';

import 'package:wasel_app/core/features/menu/items/services/item_sevice.dart';
import 'package:wasel_app/core/features/menu/model/menu_model.dart';

class ItemRepo {
  ItemRepo({required this.itemService});
  final ItemSevice itemService;
  Future<bool> addItem({
    required String name,
    required double price,
    required String description,
    required List images,
    required String category,
  }) async {
    try {
      final List<dynamic> multipartImages = await _handelImageToMultiPartImages(
        images,
      );
      final FormData formData = FormData.fromMap({
        'title': name,
        'price': price,
        'description': description,
        "category": category,
        'images': multipartImages,
      });

      final Response response = await itemService.addNewItem(
        'item/add',
        formData,
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MenuModel>> getAllItems() async {
    try {
      final result = await itemService.get('items');
      final List data = result.data;
      return data.map((e) => MenuModel.fromJson(e)).toList();
    } catch (e) {
      print("Feild to ge items : $e");
      rethrow;
    }
  }

  Future<bool> updateItem(
    int id, {
    required String name,
    required double price,
    required String description,
    required List images,
    required String category,
  }) async {
    final List<dynamic> multipartImages = await _handelImageToMultiPartImages(
      images,
    );
    final FormData formData = FormData.fromMap({
      'title': name,
      'price': price,
      'description': description,
      "category": category,
      'images': multipartImages,
    });

    try {
      final bool result = await itemService.updateItem("item/$id", formData);
      return result;
    } catch (e) {
      print("Feild to update item : $e");
      rethrow;
    }
  }

  Future<bool> deleteItem(int id) async {
    try {
      final bool result = await itemService.deleteItem('item/$id');
      return result;
    } catch (e) {
      print('feild to delete item: $e');
      rethrow;
    }
  }

  Future<List<dynamic>> _handelImageToMultiPartImages(images) async {
    List<dynamic> multipartImages = [];
    for (String image in images) {
      if (!image.startsWith('http')) {
        String fileName = image.split('/').last;
        multipartImages.add(
          await MultipartFile.fromFile(image, filename: fileName),
        );
      } else {
        multipartImages.add(image);
      }
    }
    return multipartImages;
  }
}
