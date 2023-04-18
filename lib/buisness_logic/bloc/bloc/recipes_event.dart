// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recipes_bloc.dart';

@immutable
abstract class RecipesEvent {}

class SearchForRecipesEvent extends RecipesEvent {
  final String keyword;
  SearchForRecipesEvent({
    required this.keyword,
  });
}
