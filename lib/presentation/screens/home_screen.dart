import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipes_app/presentation/screens/bottom_nav_bar.dart';

import '../widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sHeight = size.height;
    double sWidth = size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpeg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Column(
              children: [
                Image.asset('assets/images/middle_bowl.png'),
                Button(
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBar(),
                      ),
                    );
                  },
                  title: 'Get Started',
                  height: sHeight * 0.07,
                  width: sWidth * 0.6,
                )
              ],
            ),
            bottom: sHeight * 0.25,
            left: sWidth * 0.15,
          ),
        ],
      ),
    );
  }
}
