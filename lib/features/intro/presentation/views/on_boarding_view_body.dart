import 'package:flutter/material.dart';
import 'widgets/on_boarding_page1.dart';
import 'widgets/on_boarding_page2.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: [
        OnBoardingPage1(size: size, controller: controller),
        OnBoardingPage2(size: size, controller: controller),
      ],
    );
  }
}
