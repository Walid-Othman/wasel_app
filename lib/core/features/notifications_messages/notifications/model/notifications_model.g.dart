// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationsModelAdapter extends TypeAdapter<NotificationsModel> {
  @override
  final int typeId = 2;

  @override
  NotificationsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationsModel(
      id: fields[0] as String,
      title: fields[1] as String,
      userName: fields[2] as String,
      date: fields[3] as String,
      userImage: fields[4] as String,
      foodImage: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.userImage)
      ..writeByte(5)
      ..write(obj.foodImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) =>
    NotificationsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      userName: json['userName'] as String,
      date: json['date'] as String,
      userImage: json['user_image'] as String,
      foodImage: json['food_image'] as String,
    );

Map<String, dynamic> _$NotificationsModelToJson(NotificationsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userName': instance.userName,
      'date': instance.date,
      'user_image': instance.userImage,
      'food_image': instance.foodImage,
    };
