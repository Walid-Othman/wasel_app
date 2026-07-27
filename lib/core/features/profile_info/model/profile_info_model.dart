import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// 1. السطر دة بيربط الموديل بالملف اللي هيتكريت تلقائيًا
part 'profile_info_model.g.dart'; 

@JsonSerializable()
class ProfileInfoModel extends Equatable {
  final String imagUrl;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String dataOfBirth;
  final String location;

  const ProfileInfoModel({
    required this.imagUrl,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.dataOfBirth,
    required this.location,
  });

  @override
  List<Object?> get props => [imagUrl, fullName, phoneNumber, email, dataOfBirth, location];


  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) => _$ProfileInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileInfoModelToJson(this);
}