import 'dart:convert';
import 'dart:developer';

import 'package:astro_tak/models/profile/add_relative_request.dart';
import 'package:astro_tak/models/profile/add_relative_response.dart';
import 'package:astro_tak/models/profile/delete_relative_response.dart';
import 'package:astro_tak/models/profile/get_location_response.dart';
import 'package:astro_tak/models/profile/get_relatives_response.dart';
import 'package:astro_tak/models/profile/update_relative_request.dart';
import 'package:astro_tak/models/profile/update_relative_response.dart';
import 'package:astro_tak/repositories/url.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class ProfileRepository {
  Future<GetRelativesResponse?> getRelatives();
  Future<AddRelativeResponse?> addRelative(AddRelativeRequest req);
  Future<DeleteRelativeResponse?> deleteRelative(String uuid);
  Future<UpdateRelativeResponse?> updateRelative(
      UpdateRelativeRequest req, String uuid);
  Future<GetLocationResponse?> getLocation(String place);
}

class ProfileRepositoryImpl extends ProfileRepository {
  String getRelativesEnd = "/relative/all";
  String addRelativeEnd = "/relative";
  String deleteRelativeEnd = "/relative/delete/";
  String updateRelativeEnd = "/relative/update/";
  String getLocationEnd = "/location/place?inputPlace=";

  @override
  Future<GetRelativesResponse?> getRelatives() async {
    final uri = Uri.parse("$baseUrl$getRelativesEnd");
    Response response = await http.get(uri, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ'
    });

    if (response.statusCode == 200) {
      GetRelativesResponse ans =
          GetRelativesResponse.fromJson(jsonDecode(response.body));
      return ans;
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<AddRelativeResponse?> addRelative(AddRelativeRequest req) async {
    final uri = Uri.parse("$baseUrl$addRelativeEnd");
    Response response = await http.post(
      uri,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
        "Content-Type": "application/json"
      },
      body: jsonEncode(req),
    );
    log("${response.statusCode} ",
        name: "AddRelativeResponse", error: response.body);
    if (response.statusCode == 200) {
      AddRelativeResponse ans =
          AddRelativeResponse.fromJson(jsonDecode(response.body));
      return ans;
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<DeleteRelativeResponse?> deleteRelative(String uuid) async {
    final uri = Uri.parse("$baseUrl$deleteRelativeEnd$uuid");
    Response response = await http.post(uri, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ'
    });
    log("${response.statusCode} ",
        name: "DeleteRelativeResponse", error: response.body);
    if (response.statusCode == 200) {
      DeleteRelativeResponse ans =
          DeleteRelativeResponse.fromJson(jsonDecode(response.body));
      return ans;
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<UpdateRelativeResponse?> updateRelative(
      UpdateRelativeRequest req, String uuid) async {
    final uri = Uri.parse("$baseUrl$updateRelativeEnd$uuid");
    Response response = await http.post(uri,
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ'
        },
        body: jsonEncode(req));
    log("${response.statusCode} ",
        name: "UpdateRelativeResponse", error: response.body);
    if (response.statusCode == 200) {
      UpdateRelativeResponse ans =
          UpdateRelativeResponse.fromJson(jsonDecode(response.body));
      return ans;
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<GetLocationResponse?> getLocation(String place) async {
    final uri = Uri.parse("$baseUrl$getLocationEnd$place");
    Response response = await http.get(uri, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ'
    });
    log("${response.statusCode} ",
        name: "GetLocationResponse", error: response.body);
    if (response.statusCode == 200) {
      GetLocationResponse ans =
          GetLocationResponse.fromJson(jsonDecode(response.body));
      return ans;
    } else {
      throw Exception('Failed');
    }
  }
}
