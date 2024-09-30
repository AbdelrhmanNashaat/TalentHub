import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/common/functions.dart';
import '../../../../../core/utils/assets.dart';
import '../on_boarding_view.dart';

class SplashImageWidget extends StatelessWidget {
  const SplashImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Animate(
        autoPlay: true,
        effects: [
          SlideEffect(duration: 1200.ms),
        ],
        onComplete: (controller) => CommonFunctions().navWithReplacement(
            context: context, widget: const OnBoardingView()),
        child: Image.asset(
          Assets.hireImage,
        ),
      ),
    );
  }
}
