// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wasel_app/core/features/menu/model/ingredient_model.dart';

part 'menu_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class MenuModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  @JsonKey(name: 'url_image')
  final String urlImage;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final String category;

  @HiveField(5)
  @JsonKey(name: 'review_count')
  final int reviewCount;

  @HiveField(6)
  final double rating;

  @HiveField(7)
  final String descraption;

  @HiveField(8)
  final List<String> foodImages;
@HiveField(9)
final List<IngredientModel> ingredients;
  MenuModel({
    required this.id,
    required this.title,
    required this.urlImage,
    required this.price,
    required this.category,
    required this.reviewCount,
    required this.rating,
    required this.descraption,
    required this.foodImages,
    required this.ingredients,
  });

  // دوال الـ JSON
  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);
  Map<String, dynamic> toJson() => _$MenuModelToJson(this);

  MenuModel copyWith({
    int? id,
    String? title,
    String? urlImage,
    double? price,
    String? category,
    int? reviewCount,
    double? rating,
    String? descraption,
   List<String>?foodImages,
   List<IngredientModel>? ingredients,
  }) {
    return MenuModel(
      id: id ?? this.id,
      title: title ?? this.title,
      urlImage: urlImage ?? this.urlImage,
      price: price ?? this.price,
      category: category ?? this.category,
      reviewCount: reviewCount ?? this.reviewCount,
      rating: rating ?? this.rating,
      descraption: descraption ?? this.descraption,
      foodImages: foodImages ?? this.foodImages,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}
