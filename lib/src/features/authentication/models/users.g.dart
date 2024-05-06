// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      isPremium: json['isPremium'] as bool?,
      carLicense: json['carLicense'] as String?,
      resetCode: json['resetCode'] as String?,
      lastResetDate: json['lastResetDate'] as String?,
      isVerified: json['isVerified'] as bool?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'password': instance.password,
      'isAdmin': instance.isAdmin,
      'isPremium': instance.isPremium,
      'carLicense': instance.carLicense,
      'resetCode': instance.resetCode,
      'lastResetDate': instance.lastResetDate,
      'isVerified': instance.isVerified,
    };
