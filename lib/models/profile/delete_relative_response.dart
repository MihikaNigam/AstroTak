import 'package:json_annotation/json_annotation.dart';

part 'delete_relative_response.g.dart';

@JsonSerializable()
class DeleteRelativeResponse {
  DeleteRelativeResponse({
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

  factory DeleteRelativeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRelativeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteRelativeResponseToJson(this);
}
