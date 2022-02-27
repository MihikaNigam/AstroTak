import 'package:json_annotation/json_annotation.dart';

part 'get_categories_response.g.dart';

@JsonSerializable()
class GetCategoriesResponse {
  GetCategoriesResponse({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
    required this.data,
  });

  dynamic httpStatus;
  dynamic httpStatusCode;
  dynamic success;
  dynamic message;
  dynamic apiName;
  List<CategoriesData> data;

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesResponseToJson(this);
}

@JsonSerializable()
class CategoriesData {
  CategoriesData({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.suggestions,
  });
  final dynamic id;
  final dynamic name;
  final dynamic description;
  final dynamic price;
  final List<String> suggestions;

  factory CategoriesData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDataToJson(this);
}
