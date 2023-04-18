import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.function,
    required this.title,
    required this.height,
    required this.width,
  });

  final VoidCallback function;
  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    ;
    return GestureDetector(
      onTap: function,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).primaryColor),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
