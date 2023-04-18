import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/data/models/recipe.dart';
import 'package:recipes_app/data/repository/favorites_repository.dart';

part 'change_favorite_status_event.dart';
part 'change_favorite_status_state.dart';

class ChangeFavoriteStatusBloc
    extends Bloc<ChangeFavoriteStatusEvent, ChangeFavoriteStatusState> {
  final FavoritesRepository favoritesRepository;

  ChangeFavoriteStatusBloc(this.favoritesRepository)
      : super(ChangeFavoriteStatusInitial()) {
    on<ChangeFavoriteStatus>((event, emit) async {
      try {
        emit(ChangingFavoriteStatus());
        await favoritesRepository.setFavoriteStatus(
            event.recipe, !event.isFavorite);
        emit(FavoriteStatusChanged(isFavorite: !event.isFavorite));
      } catch (e) {
        emit(ChangingFavoriteStatusFailed());
      }
    });
  }
}
