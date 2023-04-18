// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_favorite_status_bloc.dart';

@immutable
abstract class ChangeFavoriteStatusState {}

class ChangeFavoriteStatusInitial extends ChangeFavoriteStatusState {}

class ChangingFavoriteStatus extends ChangeFavoriteStatusState {}

class FavoriteStatusChanged extends ChangeFavoriteStatusState {
  final bool isFavorite;
  FavoriteStatusChanged({
    required this.isFavorite,
  });
}

class ChangingFavoriteStatusFailed extends ChangeFavoriteStatusState {}
