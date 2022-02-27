import 'package:json_annotation/json_annotation.dart';

part 'add_relative_response.g.dart';

@JsonSerializable()
class AddRelativeResponse {
  AddRelativeResponse({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
  });

  dynamic httpStatus;
  dynamic httpStatusCode;
  dynamic success;
  dynamic message;
  dynamic apiName;

  factory AddRelativeResponse.fromJson(Map<String, dynamic> json) =>
      _$AddRelativeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddRelativeResponseToJson(this);
}
