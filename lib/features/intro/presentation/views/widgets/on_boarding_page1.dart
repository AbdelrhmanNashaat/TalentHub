import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'indicator.dart';
import 'on_boarding_bottom_section.dart';
import 'on_boarding_header_widget.dart';

class OnBoardingPage1 extends StatelessWidget {
  final Size size;
  final PageController controller;
  const OnBoardingPage1({
    super.key,
    required this.size,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(duration: 1600.ms),
      ],
      child: Column(
        children: [
          const CustomOnBoardingHeaderWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: OnBoardingBottomSection(controller: controller),
          ),
          const SizedBox(height: 45),
          DotsIndicatorWidget(controller: controller),
          const Spacer(),
        ],
      ),
    );
  }
}
