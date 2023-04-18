import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/data/models/recipe.dart';
import 'package:recipes_app/data/repository/recipes_repository.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc() : super(RecipesInitial()) {
    final RecipesRepository recipesRepository = RecipesRepository();
    on<SearchForRecipesEvent>((event, emit) async {
      emit(FetchingRecipes());
      try {
        final result = await recipesRepository.getRecipes(event.keyword);
        emit(RecipesFetched(recipes: result));
      } catch (e) {
        emit(FetchingRecipesFailed(error: e.toString()));
      }
    });
  }
}
