// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      phone: json['phone'] as int,
      address: json['address'] as String,
      email: json['email'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      password: json['password'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'password': instance.password,
      'isActive': instance.isActive,
    };
