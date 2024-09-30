import 'package:flutter/material.dart';
import 'widgets/splash_image_widget.dart';
import 'widgets/splash_text_image.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SplashImageWidget(),
        SplashTextWidget(),
      ],
    );
  }
}
