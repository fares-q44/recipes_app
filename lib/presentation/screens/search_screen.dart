import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/buisness_logic/bloc/bloc/recipes_bloc.dart';
import 'package:recipes_app/presentation/widgets/button.dart';
import 'package:recipes_app/presentation/widgets/single_recipe_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sHeight = size.height;
    double sWidth = size.width;
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 15),
      child: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              height: sHeight * 0.07,
              width: sWidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                  ),
                  hintText: 'Search For a recipe',
                  hintStyle: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
          SizedBox(
            height: sHeight * 0.01,
          ),
          BlocBuilder<RecipesBloc, RecipesState>(
            builder: (context, state) {
              if (state is FetchingRecipes) {
                return CircularProgressIndicator.adaptive();
              } else {
                return Button(
                  function: () {
                    BlocProvider.of<RecipesBloc>(context)
                        .add(SearchForRecipesEvent(keyword: controller.text));
                  },
                  title: 'Search',
                  height: sHeight * 0.06,
                  width: sWidth * 0.4,
                );
              }
            },
          ),
          SizedBox(
            height: sHeight * 0.02,
          ),
          BlocBuilder<RecipesBloc, RecipesState>(
            builder: (context, state) {
              if (state is RecipesFetched) {
                return Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: ((sWidth * 0.4) / (sHeight * 0.25)),
                        children: state.recipes
                            .map((recipe) => SingleRecipeItem(
                                  recipe: recipe,
                                ))
                            .toList()));
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
