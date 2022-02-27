import 'package:json_annotation/json_annotation.dart';

part 'get_relatives_response.g.dart';

@JsonSerializable()
class GetRelativesResponse {
  GetRelativesResponse({
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
  RelativesData data;

  factory GetRelativesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRelativesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRelativesResponseToJson(this);
}

@JsonSerializable()
class RelativesData {
  RelativesData({
    required this.pageNo,
    required this.numberOfElements,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.allRelatives,
  });
  final dynamic pageNo;
  final dynamic numberOfElements;
  final dynamic pageSize;
  final dynamic totalElements;
  final dynamic totalPages;
  final List<Relatives> allRelatives;

  factory RelativesData.fromJson(Map<String, dynamic> json) =>
      _$RelativesDataFromJson(json);

  Map<String, dynamic> toJson() => _$RelativesDataToJson(this);
}

@JsonSerializable()
class Relatives {
  Relatives({
    required this.uuid,
    required this.relation,
    required this.relationId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.gender,
    required this.dateAndTimeOfBirth,
    required this.totalPages,
    required this.birthDetails,
    required this.birthPlace,
  });
  final dynamic uuid;
  final dynamic relation;
  final dynamic relationId;
  final dynamic firstName;
  final dynamic middleName;
  final dynamic lastName;
  final dynamic fullName;
  final dynamic gender;
  final dynamic dateAndTimeOfBirth;
  final dynamic totalPages;
  final BirthDetails birthDetails;
  final BirthPlace birthPlace;

  factory Relatives.fromJson(Map<String, dynamic> json) =>
      _$RelativesFromJson(json);

  Map<String, dynamic> toJson() => _$RelativesToJson(this);
}

@JsonSerializable()
class BirthDetails {
  BirthDetails({
    required this.dobYear,
    required this.dobMonth,
    required this.dobDay,
    required this.tobHour,
    required this.tobMin,
    required this.meridiem,
  });
  final dynamic dobYear;
  final dynamic dobMonth;
  final dynamic dobDay;
  final dynamic tobHour;
  final dynamic tobMin;
  final dynamic meridiem;

  factory BirthDetails.fromJson(Map<String, dynamic> json) =>
      _$BirthDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BirthDetailsToJson(this);
}

@JsonSerializable()
class BirthPlace {
  BirthPlace({
    required this.placeName,
    required this.placeId,
  });
  final dynamic placeName;
  final dynamic placeId;

  factory BirthPlace.fromJson(Map<String, dynamic> json) =>
      _$BirthPlaceFromJson(json);

  Map<String, dynamic> toJson() => _$BirthPlaceToJson(this);
}
