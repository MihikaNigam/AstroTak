import 'package:json_annotation/json_annotation.dart';

part 'update_relative_response.g.dart';

@JsonSerializable()
class UpdateRelativeResponse {
  UpdateRelativeResponse({
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

  factory UpdateRelativeResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRelativeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateRelativeResponseToJson(this);
}
