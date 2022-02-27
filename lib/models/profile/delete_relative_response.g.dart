// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_relative_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRelativeResponse _$DeleteRelativeResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteRelativeResponse(
      httpStatus: json['httpStatus'],
      httpStatusCode: json['httpStatusCode'],
      success: json['success'],
      message: json['message'],
      apiName: json['apiName'],
    );

Map<String, dynamic> _$DeleteRelativeResponseToJson(
        DeleteRelativeResponse instance) =>
    <String, dynamic>{
      'httpStatus': instance.httpStatus,
      'httpStatusCode': instance.httpStatusCode,
      'success': instance.success,
      'message': instance.message,
      'apiName': instance.apiName,
    };
