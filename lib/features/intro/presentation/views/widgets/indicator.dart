import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicatorWidget extends StatelessWidget {
  final PageController controller;
  const DotsIndicatorWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 2,
      effect: WormEffect(
        dotWidth: 10.0,
        dotHeight: 10.0,
        activeDotColor: Constant.primaryColor,
      ),
    );
  }
}
