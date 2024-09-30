import 'package:flutter/material.dart';

import '../../../../constant.dart';
import 'on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldColor,
      body: const SafeArea(
        child: OnBoardingViewBody(),
      ),
    );
  }
}
