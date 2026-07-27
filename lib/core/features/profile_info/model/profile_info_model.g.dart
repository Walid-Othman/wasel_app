// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileInfoModel _$ProfileInfoModelFromJson(Map<String, dynamic> json) =>
    ProfileInfoModel(
      imagUrl: json['imagUrl'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      dataOfBirth: json['dataOfBirth'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$ProfileInfoModelToJson(ProfileInfoModel instance) =>
    <String, dynamic>{
      'imagUrl': instance.imagUrl,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'dataOfBirth': instance.dataOfBirth,
      'location': instance.location,
    };
