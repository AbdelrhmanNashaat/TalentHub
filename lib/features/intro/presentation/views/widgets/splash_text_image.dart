import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/utils/text_styles.dart';

class SplashTextWidget extends StatelessWidget {
  const SplashTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      autoPlay: true,
      effects: [
        FadeEffect(duration: 1200.ms),
      ],
      child: Text(
        'TalentHub',
        style: CustomTextStyles.style30Bold.copyWith(fontSize: 45),
      ),
    );
  }
}
