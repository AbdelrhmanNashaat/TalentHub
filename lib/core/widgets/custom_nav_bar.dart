import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleNavBar(
      activeIndex: 0,
      activeIcons: const [
        Icon(Icons.person, color: Colors.deepPurple),
        Icon(Icons.home, color: Colors.deepPurple),
        Icon(Icons.favorite, color: Colors.deepPurple),
      ],
      inactiveIcons: const [
        Text("My"),
        Text("Home"),
        Text("Like"),
      ],
      color: Colors.white,
      circleColor: Colors.white,
      height: 60,
      circleWidth: 60,
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      shadowColor: Colors.deepPurple,
      circleShadowColor: Colors.deepPurple,
      elevation: 4,
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.blue, Colors.red],
      ),
      circleGradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.blue, Colors.red],
      ),
    );
  }
}
