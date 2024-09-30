import 'package:flutter/material.dart';
import 'package:hire_me/core/common/functions.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../sign_in/presentation/views/sign_in_view.dart';

class OnBoardingTextButton extends StatelessWidget {
  const OnBoardingTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => CommonFunctions()
          .navWithReplacement(context: context, pageName: const SignInView()),
      child: Text('Skip', style: CustomTextStyles.style20Medium),
    );
  }
}
