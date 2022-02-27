import 'package:json_annotation/json_annotation.dart';

part 'get_location_response.g.dart';

@JsonSerializable()
class GetLocationResponse {
  GetLocationResponse({
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
  List<LocationData> data;

  factory GetLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLocationResponseToJson(this);
}

@JsonSerializable()
class LocationData {
  LocationData({
    required this.placeName,
    required this.placeId,
  });

  dynamic placeName;
  dynamic placeId;

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}
