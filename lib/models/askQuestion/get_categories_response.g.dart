// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesResponse _$GetCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesResponse(
      httpStatus: json['httpStatus'],
      httpStatusCode: json['httpStatusCode'],
      success: json['success'],
      message: json['message'],
      apiName: json['apiName'],
      data: (json['data'] as List<dynamic>)
          .map((e) => CategoriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCategoriesResponseToJson(
        GetCategoriesResponse instance) =>
    <String, dynamic>{
      'httpStatus': instance.httpStatus,
      'httpStatusCode': instance.httpStatusCode,
      'success': instance.success,
      'message': instance.message,
      'apiName': instance.apiName,
      'data': instance.data,
    };

CategoriesData _$CategoriesDataFromJson(Map<String, dynamic> json) =>
    CategoriesData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CategoriesDataToJson(CategoriesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'suggestions': instance.suggestions,
    };
