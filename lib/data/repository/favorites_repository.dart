import 'dart:convert';

import 'package:recipes_app/data/models/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepository {
  Future<void> setFavoriteStatus(Recipe recipe, bool setFavorite) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final List<Recipe> allfavorites = await getAllFavorites();
      print(allfavorites.contains(recipe));
      if (setFavorite) {
        if (!allfavorites.contains(recipe)) {
          allfavorites.add(recipe);
        }
      } else {
        allfavorites.remove(recipe);
      }
      await prefs.setString("favoritesList3", jsonEncode(allfavorites));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Recipe>> getAllFavorites() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<dynamic> jsonData =
          jsonDecode(prefs.getString('favoritesList3') ?? '[]');
      print(jsonData.length);
      List<Recipe> FavoritesList = [];
      if (jsonData.isNotEmpty) {
        FavoritesList = jsonData.map((i) => Recipe.fromJson(i)).toList();
      }
      return FavoritesList;
    } catch (e) {
      rethrow;
    }
  }
}
