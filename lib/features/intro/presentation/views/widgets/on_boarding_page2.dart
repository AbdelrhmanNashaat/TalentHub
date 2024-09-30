import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hire_me/core/utils/text_styles.dart';

import '../../../../../core/utils/assets.dart';
import 'indicator.dart';
import 'on_boarding_bottom_section.dart';

class OnBoardingPage2 extends StatelessWidget {
  final Size size;
  final PageController controller;
  const OnBoardingPage2(
      {super.key, required this.size, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(duration: 1600.ms),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Image.asset(Assets.onBoarding2Image1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Easy To Apply\nOn Mobile App',
                  style: CustomTextStyles.style30Bold,
                ),
                Image.asset(Assets.onBoarding2Image2),
              ],
            ),
            const Spacer(),
            OnBoardingBottomSection(controller: controller),
            SizedBox(height: size.height * 0.02),
            Center(child: DotsIndicatorWidget(controller: controller)),
            SizedBox(height: size.height * 0.04),
          ],
        ),
      ),
    );
  }
}
