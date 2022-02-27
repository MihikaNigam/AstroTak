// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_relative_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRelativeRequest _$AddRelativeRequestFromJson(Map<String, dynamic> json) =>
    AddRelativeRequest(
      birthDetails:
          BirthDetails.fromJson(json['birthDetails'] as Map<String, dynamic>),
      birthPlace:
          BirthPlace.fromJson(json['birthPlace'] as Map<String, dynamic>),
      firstName: json['firstName'],
      lastName: json['lastName'],
      relationId: json['relationId'],
      gender: json['gender'],
    );

Map<String, dynamic> _$AddRelativeRequestToJson(AddRelativeRequest instance) =>
    <String, dynamic>{
      'birthDetails': instance.birthDetails,
      'birthPlace': instance.birthPlace,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'relationId': instance.relationId,
      'gender': instance.gender,
    };
