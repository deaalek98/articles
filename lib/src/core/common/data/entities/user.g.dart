// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      lastName: json['last_name'] as String?,
      firstName: json['first_name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      email: json['email'] as String?,
      id: json['id'] as int?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phone_number'] as String?,
      createdAt: json['created_at'] as String?,
      token: json['token'] as String?,
      notificationsCount: json['notifications_count'] as int?,
      tfa: json['tfa'] as int?,
      publicKey: json['public_key'] as String?,
      isContactCount: json['is_contact_count'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'phone_number': instance.phoneNumber,
      'profile_picture': instance.profilePicture,
      'created_at': instance.createdAt,
      'is_contact_count': instance.isContactCount,
      'notifications_count': instance.notificationsCount,
      'tfa': instance.tfa,
      'public_key': instance.publicKey,
      'token': instance.token,
    };
