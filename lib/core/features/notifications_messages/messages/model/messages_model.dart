// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'messages_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class MessagesModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userName;

  @HiveField(2)
  final String userImage;

  @HiveField(3)
  final String time;

  @HiveField(4)
  final String lastMessage;

  @HiveField(5)
  final int unReadMessagesCount;

  MessagesModel({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.time,
    required this.lastMessage,
    required this.unReadMessagesCount,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesModelToJson(this);

  MessagesModel copyWith({
    String? id,
    String? userName,
    String? userImage,
    String? time,
    String? lastMessage,
    int? messagesCount,
    int? unreadMessageCount,
  }) {
    return MessagesModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      time: time ?? this.time,
      lastMessage: lastMessage ?? this.lastMessage,
      unReadMessagesCount: messagesCount ?? this.unReadMessagesCount,
    );
  }
}
