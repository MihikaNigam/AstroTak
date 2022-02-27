// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_relatives_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRelativesResponse _$GetRelativesResponseFromJson(
        Map<String, dynamic> json) =>
    GetRelativesResponse(
      httpStatus: json['httpStatus'],
      httpStatusCode: json['httpStatusCode'],
      success: json['success'],
      message: json['message'],
      apiName: json['apiName'],
      data: RelativesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRelativesResponseToJson(
        GetRelativesResponse instance) =>
    <String, dynamic>{
      'httpStatus': instance.httpStatus,
      'httpStatusCode': instance.httpStatusCode,
      'success': instance.success,
      'message': instance.message,
      'apiName': instance.apiName,
      'data': instance.data,
    };

RelativesData _$RelativesDataFromJson(Map<String, dynamic> json) =>
    RelativesData(
      pageNo: json['pageNo'],
      numberOfElements: json['numberOfElements'],
      pageSize: json['pageSize'],
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
      allRelatives: (json['allRelatives'] as List<dynamic>)
          .map((e) => Relatives.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RelativesDataToJson(RelativesData instance) =>
    <String, dynamic>{
      'pageNo': instance.pageNo,
      'numberOfElements': instance.numberOfElements,
      'pageSize': instance.pageSize,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'allRelatives': instance.allRelatives,
    };

Relatives _$RelativesFromJson(Map<String, dynamic> json) => Relatives(
      uuid: json['uuid'],
      relation: json['relation'],
      relationId: json['relationId'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      gender: json['gender'],
      dateAndTimeOfBirth: json['dateAndTimeOfBirth'],
      totalPages: json['totalPages'],
      birthDetails:
          BirthDetails.fromJson(json['birthDetails'] as Map<String, dynamic>),
      birthPlace:
          BirthPlace.fromJson(json['birthPlace'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RelativesToJson(Relatives instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'relation': instance.relation,
      'relationId': instance.relationId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateAndTimeOfBirth': instance.dateAndTimeOfBirth,
      'totalPages': instance.totalPages,
      'birthDetails': instance.birthDetails,
      'birthPlace': instance.birthPlace,
    };

BirthDetails _$BirthDetailsFromJson(Map<String, dynamic> json) => BirthDetails(
      dobYear: json['dobYear'],
      dobMonth: json['dobMonth'],
      dobDay: json['dobDay'],
      tobHour: json['tobHour'],
      tobMin: json['tobMin'],
      meridiem: json['meridiem'],
    );

Map<String, dynamic> _$BirthDetailsToJson(BirthDetails instance) =>
    <String, dynamic>{
      'dobYear': instance.dobYear,
      'dobMonth': instance.dobMonth,
      'dobDay': instance.dobDay,
      'tobHour': instance.tobHour,
      'tobMin': instance.tobMin,
      'meridiem': instance.meridiem,
    };

BirthPlace _$BirthPlaceFromJson(Map<String, dynamic> json) => BirthPlace(
      placeName: json['placeName'],
      placeId: json['placeId'],
    );

Map<String, dynamic> _$BirthPlaceToJson(BirthPlace instance) =>
    <String, dynamic>{
      'placeName': instance.placeName,
      'placeId': instance.placeId,
    };
