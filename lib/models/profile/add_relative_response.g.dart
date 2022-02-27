// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_relative_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRelativeResponse _$AddRelativeResponseFromJson(Map<String, dynamic> json) =>
    AddRelativeResponse(
      httpStatus: json['httpStatus'],
      httpStatusCode: json['httpStatusCode'],
      success: json['success'],
      message: json['message'],
      apiName: json['apiName'],
    );

Map<String, dynamic> _$AddRelativeResponseToJson(
        AddRelativeResponse instance) =>
    <String, dynamic>{
      'httpStatus': instance.httpStatus,
      'httpStatusCode': instance.httpStatusCode,
      'success': instance.success,
      'message': instance.message,
      'apiName': instance.apiName,
    };
