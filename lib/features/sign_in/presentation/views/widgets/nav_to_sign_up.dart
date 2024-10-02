import 'package:flutter/material.dart';
import 'package:hire_me/core/common/functions.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../sign_up/presentation/views/sign_up_view.dart';

class NavToSignUp extends StatelessWidget {
  const NavToSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: CustomTextStyles.style16Medium.copyWith(fontSize: 18),
        ),
        GestureDetector(
          onTap: () => CommonFunctions().navWithReplacement(
            context: context,
            pageName: const SignUpView(),
          ),
          child: Text(
            'Sign up',
            style: CustomTextStyles.style16Medium
                .copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
