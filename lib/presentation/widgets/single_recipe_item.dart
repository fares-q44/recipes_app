import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/screens/recipe_details_screen.dart';

import '../../data/models/recipe.dart';

class SingleRecipeItem extends StatelessWidget {
  const SingleRecipeItem({
    super.key,
    required this.recipe,
  });
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sHeight = size.height;
    double sWidth = size.width;
    return GestureDetector(
      key: UniqueKey(),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailsScreen(recipe: recipe),
            ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 9))
              ]),
          child: Center(
              child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                child: Image.network(
                  recipe.image,
                  width: sWidth * 0.4,
                  height: sHeight * 0.18,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: sHeight * 0.02,
              ),
              Text(
                recipe.name,
                style: TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: sHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: sWidth * 0.01,
                  ),
                  Text(
                    (recipe.rating * 10).toStringAsFixed(2),
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '/10',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
