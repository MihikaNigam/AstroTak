import 'dart:convert';
import 'dart:developer';

import 'package:astro_tak/models/askQuestion/get_categories_response.dart';
import 'package:astro_tak/repositories/url.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class AskQuestionRepository {
  Future<GetCategoriesResponse?> getCategories();
}

class AskQuestionRepositoryImpl extends AskQuestionRepository {
  String getCategoryEnd = "/question/category/all";

  @override
  Future<GetCategoriesResponse?> getCategories() async {
    final uri = Uri.parse("$baseUrl$getCategoryEnd");
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      GetCategoriesResponse ans =
          GetCategoriesResponse.fromJson(jsonDecode(response.body));
      return ans;
    } else {
      throw Exception('Failed');
    }
  }
}
