import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/data/models/recipe.dart';
import 'package:recipes_app/data/repository/favorites_repository.dart';

part 'get_all_favorited_recipes_event.dart';
part 'get_all_favorited_recipes_state.dart';

class GetAllFavoritedRecipesBloc
    extends Bloc<GetAllFavoritedRecipesEvent, GetAllFavoritedRecipesState> {
  final FavoritesRepository favoritesRepository;

  GetAllFavoritedRecipesBloc(this.favoritesRepository)
      : super(GetAllFavoritedRecipesInitial()) {
    final FavoritesRepository favoritesRepository = FavoritesRepository();
    on<GetAllRecipes>((event, emit) async {
      try {
        emit(FetchingAllFavoritedRecipes());
        final favorites = await favoritesRepository.getAllFavorites();
        emit(AllFavoritedRecipesFetched(allRecipe: favorites));
      } catch (e) {
        emit(FetchingAllFavoritedRecipesFailed());
      }
    });
  }
}
