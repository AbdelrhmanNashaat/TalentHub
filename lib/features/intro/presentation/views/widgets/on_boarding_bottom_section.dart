import 'package:flutter/material.dart';
import 'on_boarding_skip_button.dart';
import 'on_boarding_text_button.dart';

class OnBoardingBottomSection extends StatelessWidget {
  final PageController controller;
  const OnBoardingBottomSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const OnBoardingTextButton(),
        OnBoardingNextButtonButton(controller: controller),
      ],
    );
  }
}
