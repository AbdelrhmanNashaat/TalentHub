import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/utils/assets.dart';

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
          SlideEffect(duration: 800.ms),
        ],
        child: Image.asset(
          Assets.hireImage,
        ),
      ),
    );
  }
}
