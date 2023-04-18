import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/buisness_logic/bloc/bloc/recipes_bloc.dart';
import 'package:recipes_app/buisness_logic/bloc/change_favorite_status_bloc.dart';
import 'package:recipes_app/buisness_logic/bloc/check_favorite_status_bloc.dart';
import 'package:recipes_app/buisness_logic/bloc/get_all_favorited_recipes_bloc.dart';
import 'package:recipes_app/data/api/recipes_api.dart';
import 'package:recipes_app/data/repository/favorites_repository.dart';
import 'package:recipes_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FavoritesRepository favoritesRepository = FavoritesRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipesBloc(),
        ),
        BlocProvider(
            create: (context) =>
                GetAllFavoritedRecipesBloc(favoritesRepository)),
        BlocProvider(
          create: (context) => CheckFavoriteStatusBloc(favoritesRepository),
        ),
        BlocProvider(
          create: (context) => ChangeFavoriteStatusBloc(favoritesRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(217, 150, 81, 1),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
