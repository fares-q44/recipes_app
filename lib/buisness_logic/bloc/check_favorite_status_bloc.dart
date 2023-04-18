import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/buisness_logic/bloc/get_all_favorited_recipes_bloc.dart';
import 'package:recipes_app/data/models/recipe.dart';
import 'package:recipes_app/data/repository/favorites_repository.dart';
import 'package:recipes_app/data/repository/recipes_repository.dart';

part 'check_favorite_status_event.dart';
part 'check_favorite_status_state.dart';

class CheckFavoriteStatusBloc
    extends Bloc<CheckFavoriteStatusEvent, CheckFavoriteStatusState> {
  final FavoritesRepository favoritesRepository;
  CheckFavoriteStatusBloc(this.favoritesRepository)
      : super(CheckFavoriteStatusInitial()) {
    on<CheckFavoriteStatus>((event, emit) async {
      try {
        emit(CheckingFavoriteStatus());
        final List<Recipe> favorited =
            await favoritesRepository.getAllFavorites();
        if (favorited.contains(event.recipe)) {
          emit(FavoriteStatusChecked(isFavorite: true));
        } else {
          emit(FavoriteStatusChecked(isFavorite: false));
        }
      } catch (e) {
        print(e);
        emit(CheckingFavoriteStatusFailed());
      }
    });
  }
}
