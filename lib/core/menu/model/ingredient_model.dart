import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';


part 'ingredient_model.g.dart'; 

@JsonSerializable() 
@HiveType(typeId: 4) 
class IngredientModel extends HiveObject {
  
  @HiveField(0) 
  final String name;

  @HiveField(1)
  @JsonKey(name: 'item_image')
  final String itemImage;

  IngredientModel({
    required this.name,
    required this.itemImage,
  });


  factory IngredientModel.fromJson(Map<String, dynamic> json) => 
      _$IngredientModelFromJson(json);

 
  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}