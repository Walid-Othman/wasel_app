// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_review_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0) 
class UserReviewModel extends HiveObject {
  
  @HiveField(0)
 
  final String userImage;

  @HiveField(1)
  final String userName;

  @HiveField(2)
  final double rating; 

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String comment;

  UserReviewModel({
    required this.userImage,
    required this.userName,
    required this.rating,
    required this.date,
    required this.comment,
  });

  // دالة التحويل من JSON
  factory UserReviewModel.fromJson(Map<String, dynamic> json) =>
      _$UserReviewModelFromJson(json);

  // دالة التحويل إلى JSON
  Map<String, dynamic> toJson() => _$UserReviewModelToJson(this);

  UserReviewModel copyWith({
    String? userImage,
    String? userName,
    double? rating,
    String? date,
    String? comment,
  }) {
    return UserReviewModel(
      userImage: userImage ?? this.userImage,
      userName: userName ?? this.userName,
      rating: rating ?? this.rating,
      date: date ?? this.date,
      comment: comment ?? this.comment,
    );
  }
}
