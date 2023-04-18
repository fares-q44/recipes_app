// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_favorite_status_bloc.dart';

@immutable
abstract class ChangeFavoriteStatusEvent {}

class ChangeFavoriteStatus extends ChangeFavoriteStatusEvent {
  final Recipe recipe;
  final bool isFavorite;
  ChangeFavoriteStatus({
    required this.recipe,
    required this.isFavorite,
  });
}
