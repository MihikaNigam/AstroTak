import 'package:astro_tak/models/profile/get_relatives_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_relative_request.g.dart';

@JsonSerializable()
class UpdateRelativeRequest {
  UpdateRelativeRequest({
    required this.uuid,
    required this.relation,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.birthDetails,
    required this.birthPlace,
    required this.gender,
    required this.dateAndTimeOfBirth,
    required this.relationId,
  });
  final dynamic uuid;
  final dynamic relation;
  final dynamic firstName;
  final dynamic middleName;
  final dynamic lastName;
  final dynamic fullName;
  final dynamic gender;
  final dynamic dateAndTimeOfBirth;
  final BirthDetails birthDetails;
  final BirthPlace birthPlace;

  final dynamic relationId;

  factory UpdateRelativeRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateRelativeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateRelativeRequestToJson(this);
}
