// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessagesModelAdapter extends TypeAdapter<MessagesModel> {
  @override
  final int typeId = 3;

  @override
  MessagesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessagesModel(
      id: fields[0] as String,
      userName: fields[1] as String,
      userImage: fields[2] as String,
      time: fields[3] as String,
      lastMessage: fields[4] as String,
      unReadMessagesCount: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MessagesModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userImage)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.lastMessage)
      ..writeByte(5)
      ..write(obj.unReadMessagesCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessagesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) =>
    MessagesModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      userImage: json['userImage'] as String,
      time: json['time'] as String,
      lastMessage: json['lastMessage'] as String,
      unReadMessagesCount: (json['messagesCount'] as num).toInt(),
    );

Map<String, dynamic> _$MessagesModelToJson(MessagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'time': instance.time,
      'lastMessage': instance.lastMessage,
      'messagesCount': instance.unReadMessagesCount,
    };
