import 'package:astro_tak/models/profile/get_relatives_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_relative_request.g.dart';

@JsonSerializable()
class AddRelativeRequest {
  AddRelativeRequest({
    required this.birthDetails,
    required this.birthPlace,
    required this.firstName,
    required this.lastName,
    required this.relationId,
    required this.gender,
  });

  final BirthDetails birthDetails;
  final BirthPlace birthPlace;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic relationId;
  final dynamic gender;

  factory AddRelativeRequest.fromJson(Map<String, dynamic> json) =>
      _$AddRelativeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddRelativeRequestToJson(this);
}
