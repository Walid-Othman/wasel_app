// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class OrderModel extends HiveObject {
  
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String type;

  @HiveField(3)
  @JsonKey(name: 'url_image') 
  final String urlImage;

  @HiveField(4)
  final double price; 

  OrderModel({
    required this.id,
    required this.title,
    required this.type,
    required this.urlImage,
    required this.price,
  });

  // Json Serialization
  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  OrderModel copyWith({
    String? id,
    String? title,
    String? type,
    String? urlImage,
    double? price,
  }) {
    return OrderModel(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      urlImage: urlImage ?? this.urlImage,
      price: price ?? this.price,
    );
  }
}
