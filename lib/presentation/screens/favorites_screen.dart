import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/buisness_logic/bloc/get_all_favorited_recipes_bloc.dart';
import 'package:recipes_app/presentation/widgets/single_recipe_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetAllFavoritedRecipesBloc>(context).add(GetAllRecipes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sHeight = size.height;
    double sWidth = size.width;
    return BlocBuilder<GetAllFavoritedRecipesBloc, GetAllFavoritedRecipesState>(
      builder: (context, state) {
        if (state is AllFavoritedRecipesFetched) {
          if (state.allRecipe.isNotEmpty) {
            return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: ((sWidth * 0.4) / (sHeight * 0.25)),
                children: state.allRecipe
                    .map((recipe) => SingleRecipeItem(
                          recipe: recipe,
                        ))
                    .toList());
          } else {
            return Center(
              child: Text('You have no Favorites'),
            );
          }
        } else {
          return CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
