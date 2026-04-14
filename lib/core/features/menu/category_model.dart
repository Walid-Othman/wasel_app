// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  final String id;
  final String title;

  CategoryModel({required this.id, required this.title});

  // قائمة جاهزة بالبيانات
  static List<CategoryModel> categories = [
    CategoryModel(id: '1', title: 'All'),
    CategoryModel(id: '2', title: 'Breakfast'),
    CategoryModel(id: '3', title: 'Lunch'),
    CategoryModel(id: '4', title: 'Dinner'),
  ];
}
