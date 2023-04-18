import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipes_app/data/api/recipes_api.dart';
import 'package:recipes_app/data/models/recipe.dart';

class RecipesRepository {
  final RecipesAPI recipesAPI = RecipesAPI();
  Future<List<Recipe>> getRecipes(String searchTerm) async {
    try {
      final result = await recipesAPI.getRecipes(searchTerm);
      final List<Recipe> recipes = [];
      final List allRecipes = result['results'];
      allRecipes.forEach((recipe) {
        final List<String> instructions = [];
        final List<String> ingredients = [];
        if (recipe['instructions'] != null) {
          recipe['instructions'].forEach((e) {
            instructions.add(e['display_text']);
          });
        }
        if (recipe['sections'] != null) {
          recipe['sections'][0]['components'].forEach((ingedient) {
            ingredients.add(ingedient['raw_text']);
          });
        }

        double rating = 0.0;
        if (recipe['user_ratings'] == null) {
        } else if (recipe['user_ratings']['score'] == null) {
        } else if (recipe['user_ratings']['score'] is int) {
          rating = double.parse(recipe['user_ratings']['score'].toString());
        } else {
          rating = recipe['user_ratings']['score'];
        }
        recipes.add(
          Recipe(
            id: recipe['id'],
            name: recipe['name'],
            image: recipe['thumbnail_url'],
            description: recipe['description'] ?? 'No Description for now',
            rating: rating,
            instructions: instructions,
            ingredients: ingredients,
          ),
        );
      });
      return recipes;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
