// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_all_favorited_recipes_bloc.dart';

@immutable
abstract class GetAllFavoritedRecipesState {}

class GetAllFavoritedRecipesInitial extends GetAllFavoritedRecipesState {}

class FetchingAllFavoritedRecipes extends GetAllFavoritedRecipesState {}

class AllFavoritedRecipesFetched extends GetAllFavoritedRecipesState {
  final List<Recipe> allRecipe;
  AllFavoritedRecipesFetched({
    required this.allRecipe,
  });
}

class FetchingAllFavoritedRecipesFailed extends GetAllFavoritedRecipesState {}
