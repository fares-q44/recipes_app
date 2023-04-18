// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_favorite_status_bloc.dart';

@immutable
abstract class CheckFavoriteStatusEvent {}

class CheckFavoriteStatus extends CheckFavoriteStatusEvent {
  final Recipe recipe;
  CheckFavoriteStatus({
    required this.recipe,
  });
}
