abstract interface class BaseItemService {
  Future<void> addNewItem(String baseUrl, data);

  Future<dynamic> getItems(String baseUrl);

  Future<bool> updateItem(String baseUrl, data);

  Future<bool> deleteItem(String baseUrl);
}
