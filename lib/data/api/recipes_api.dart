import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/data/models/recipe.dart';

class RecipesAPI {
  Future<Map> getRecipes(String searchTerm) async {
    try {
      final url = Uri.https(
        'tasty.p.rapidapi.com',
        '/recipes/list',
        {'from': '0', 'size': '20', 'q': searchTerm},
      );
      final result = await http.get(url, headers: {
        'X-RapidAPI-Key': '756c3c7bb7mshc8ccde1ebcc1970p193053jsncd1ba996c1e5',
        'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
      });
      return jsonDecode(result.body);
    } catch (e) {
      rethrow;
    }
  }
}
