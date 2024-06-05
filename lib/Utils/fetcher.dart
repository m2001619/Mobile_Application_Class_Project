import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_application_class/Models/category_model.dart';

class ApiService {
  static const String url =
      'https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List categoriesJson = json.decode(response.body)['categories'];
      return categoriesJson.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
