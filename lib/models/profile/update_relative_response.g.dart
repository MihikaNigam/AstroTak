// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_relative_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRelativeResponse _$UpdateRelativeResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateRelativeResponse(
      httpStatus: json['httpStatus'],
      httpStatusCode: json['httpStatusCode'],
      success: json['success'],
      message: json['message'],
      apiName: json['apiName'],
    );

Map<String, dynamic> _$UpdateRelativeResponseToJson(
        UpdateRelativeResponse instance) =>
    <String, dynamic>{
      'httpStatus': instance.httpStatus,
      'httpStatusCode': instance.httpStatusCode,
      'success': instance.success,
      'message': instance.message,
      'apiName': instance.apiName,
    };
