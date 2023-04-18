// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_favorite_status_bloc.dart';

@immutable
abstract class CheckFavoriteStatusState {}

class CheckFavoriteStatusInitial extends CheckFavoriteStatusState {}

class CheckingFavoriteStatus extends CheckFavoriteStatusState {}

class FavoriteStatusChecked extends CheckFavoriteStatusState {
  final bool isFavorite;
  FavoriteStatusChecked({
    required this.isFavorite,
  });
}

class CheckingFavoriteStatusFailed extends CheckFavoriteStatusState {}
