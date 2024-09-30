import 'package:flutter/material.dart';
import 'package:hire_me/features/intro/presentation/views/splash_view_body.dart';

import '../../../../constant.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldColor,
      body: const SafeArea(
        child: SplashViewBody(),
      ),
    );
  }
}
