import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/common/functions.dart';
import '../../../../sign_in/presentation/views/sign_in_view.dart';

class OnBoardingNextButtonButton extends StatelessWidget {
  final PageController controller;
  const OnBoardingNextButtonButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.page!.toInt() < 1) {
          controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        } else {
          CommonFunctions()
              .navWithReplacement(context: context, widget: const SignInView());
        }
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Constant.circleAvatar,
        child: Center(
          child: Icon(
            Icons.arrow_forward,
            color: Constant.iconColor,
          ),
        ),
      ),
    );
  }
}
