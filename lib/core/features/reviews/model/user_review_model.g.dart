// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_review_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserReviewModelAdapter extends TypeAdapter<UserReviewModel> {
  @override
  final int typeId = 0;

  @override
  UserReviewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserReviewModel(
      userImage: fields[0] as String,
      userName: fields[1] as String,
      rating: fields[2] as double,
      date: fields[3] as String,
      comment: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserReviewModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userImage)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserReviewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReviewModel _$UserReviewModelFromJson(Map<String, dynamic> json) =>
    UserReviewModel(
      userImage: json['userImage'] as String,
      userName: json['userName'] as String,
      rating: (json['rating'] as num).toDouble(),
      date: json['date'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$UserReviewModelToJson(UserReviewModel instance) =>
    <String, dynamic>{
      'userImage': instance.userImage,
      'userName': instance.userName,
      'rating': instance.rating,
      'date': instance.date,
      'comment': instance.comment,
    };
