// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class NotificationsModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String userName;

  @HiveField(3)
  final String date;

  @HiveField(4)
  @JsonKey(name: 'user_image')
  final String userImage;

  @HiveField(5)
  @JsonKey(name: 'food_image')
  final String foodImage;

  NotificationsModel({
    required this.id,
    required this.title,
    required this.userName,
    required this.date,
    required this.userImage,
    required this.foodImage,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsModelToJson(this);

  NotificationsModel copyWith({
    String? id,
    String? title,
    String? type,
    String? date,
    String? userImage,
    String? foodImage,
  }) {
    return NotificationsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      userName: type ?? this.userName,
      date: date ?? this.date,
      userImage: userImage ?? this.userImage,
      foodImage: foodImage ?? this.foodImage,
    );
  }
}
