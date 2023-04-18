// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recipes_bloc.dart';

@immutable
abstract class RecipesState {}

class RecipesInitial extends RecipesState {}

class FetchingRecipes extends RecipesState {}

class RecipesFetched extends RecipesState {
  final List<Recipe> recipes;
  RecipesFetched({
    required this.recipes,
  });
}

class FetchingRecipesFailed extends RecipesState {
  final String error;
  FetchingRecipesFailed({
    required this.error,
  });
}
