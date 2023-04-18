// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'dart:developer';

import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;
  final double rating;
  final List<String> instructions;
  final List<String> ingredients;
  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
    required this.instructions,
    required this.ingredients,
  });
  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        rating: json['rating'],
        instructions: List<String>.from(json['instructions']),
        ingredients: List<String>.from(json['ingredients']));
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'rating': rating,
      'instructions': instructions,
      'ingredients': ingredients
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props {
    return [id, name, image, description, rating, instructions, ingredients];
  }
}
