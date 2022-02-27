// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_relative_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRelativeRequest _$UpdateRelativeRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateRelativeRequest(
      uuid: json['uuid'],
      relation: json['relation'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      birthDetails:
          BirthDetails.fromJson(json['birthDetails'] as Map<String, dynamic>),
      birthPlace:
          BirthPlace.fromJson(json['birthPlace'] as Map<String, dynamic>),
      gender: json['gender'],
      dateAndTimeOfBirth: json['dateAndTimeOfBirth'],
      relationId: json['relationId'],
    );

Map<String, dynamic> _$UpdateRelativeRequestToJson(
        UpdateRelativeRequest instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'relation': instance.relation,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateAndTimeOfBirth': instance.dateAndTimeOfBirth,
      'birthDetails': instance.birthDetails,
      'birthPlace': instance.birthPlace,
      'relationId': instance.relationId,
    };
