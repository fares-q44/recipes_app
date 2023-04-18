import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/buisness_logic/bloc/change_favorite_status_bloc.dart';
import 'package:recipes_app/buisness_logic/bloc/get_all_favorited_recipes_bloc.dart';
import 'package:recipes_app/data/models/recipe.dart';

import '../../buisness_logic/bloc/check_favorite_status_bloc.dart';
import '../widgets/single_ingredient_item.dart';
import '../widgets/single_instruction_item.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);
  final Recipe recipe;

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CheckFavoriteStatusBloc>(context)
        .add(CheckFavoriteStatus(recipe: widget.recipe));
    super.initState();
  }

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sHeight = size.height;
    double sWidth = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: sHeight * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  BlocListener<ChangeFavoriteStatusBloc,
                      ChangeFavoriteStatusState>(
                    child: Container(),
                    listener: (context, state) {
                      if (state is FavoriteStatusChanged) {
                        if (state.isFavorite) {
                          setState(() {
                            isFavorite = true;
                          });
                        } else {
                          setState(() {
                            isFavorite = false;
                          });
                        }
                        BlocProvider.of<GetAllFavoritedRecipesBloc>(context)
                            .add(GetAllRecipes());
                      }
                    },
                  ),
                  BlocConsumer<CheckFavoriteStatusBloc,
                      CheckFavoriteStatusState>(
                    listener: (context, state) {
                      if (state is FavoriteStatusChecked) {
                        if (state.isFavorite) {
                          setState(() {
                            isFavorite = true;
                          });
                        } else {
                          setState(() {
                            isFavorite = false;
                          });
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is CheckingFavoriteStatus ||
                          state is CheckFavoriteStatusInitial) {
                        return CircularProgressIndicator.adaptive();
                      } else if (state is CheckingFavoriteStatusFailed) {
                        print(state);
                        return Container();
                      } else if (state is FavoriteStatusChecked) {
                        return GestureDetector(
                          onTap: () =>
                              BlocProvider.of<ChangeFavoriteStatusBloc>(context)
                                  .add(ChangeFavoriteStatus(
                                      recipe: widget.recipe,
                                      isFavorite: isFavorite)),
                          child: isFavorite
                              ? Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.red,
                                  size: 30,
                                )
                              : Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.black,
                                  size: 30,
                                ),
                        );
                      } else {
                        print(state);
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: sHeight * 0.1,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: sHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(300, 200)),
                      color: Theme.of(context).primaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: sHeight * 0.2,
                      ),
                      Text(
                        widget.recipe.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      SizedBox(
                        height: sHeight * 0.01,
                      ),
                      Text(
                        widget.recipe.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: sWidth * 0.007,
                          ),
                          Text(
                            (widget.recipe.rating * 10).toStringAsFixed(2),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Ingredients: ',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sHeight * 0.01,
                      ),
                      Container(
                        height: sHeight * 0.12,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return SingleIngredientItem(
                              ingredient: widget.recipe.ingredients[index],
                            );
                          },
                          itemCount: widget.recipe.ingredients.length,
                        ),
                      ),
                      SizedBox(
                        height: sHeight * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Instructions: ',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sHeight * 0.01,
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return SingleInstructionItem(
                              index: index,
                              instruction: widget.recipe.instructions[index],
                            );
                          },
                          itemCount: widget.recipe.instructions.length,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: -(sHeight * 0.08),
                  left: sWidth * 0.27,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 20.0,
                            offset: Offset(0.0, 10))
                      ],
                    ),
                    child: Image.network(
                      widget.recipe.image,
                      height: sHeight * 0.25,
                      width: sWidth * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
