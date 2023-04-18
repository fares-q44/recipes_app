import 'package:flutter/material.dart';

class SingleIngredientItem extends StatelessWidget {
  const SingleIngredientItem({
    super.key,
    required this.ingredient,
  });

  final String ingredient;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sHeight = size.height;
    double sWidth = size.width;
    return Container(
      margin: EdgeInsets.only(left: sWidth * 0.02),
      height: sHeight * 0.1,
      width: sWidth * 0.3,
      decoration: BoxDecoration(
        color: Color.fromRGBO(166, 102, 38, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          ingredient,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
