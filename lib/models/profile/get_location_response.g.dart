// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLocationResponse _$GetLocationResponseFromJson(Map<String, dynamic> json) =>
    GetLocationResponse(
      httpStatus: json['httpStatus'],
      httpStatusCode: json['httpStatusCode'],
      success: json['success'],
      message: json['message'],
      apiName: json['apiName'],
      data: (json['data'] as List<dynamic>)
          .map((e) => LocationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetLocationResponseToJson(
        GetLocationResponse instance) =>
    <String, dynamic>{
      'httpStatus': instance.httpStatus,
      'httpStatusCode': instance.httpStatusCode,
      'success': instance.success,
      'message': instance.message,
      'apiName': instance.apiName,
      'data': instance.data,
    };

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      placeName: json['placeName'],
      placeId: json['placeId'],
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'placeName': instance.placeName,
      'placeId': instance.placeId,
    };
