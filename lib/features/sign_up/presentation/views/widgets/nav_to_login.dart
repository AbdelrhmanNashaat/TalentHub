import 'package:flutter/material.dart';

import '../../../../../core/common/functions.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../sign_in/presentation/views/sign_in_view.dart';

class NavToLoginWidget extends StatelessWidget {
  const NavToLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ',
            style: CustomTextStyles.style16Medium),
        GestureDetector(
          onTap: () => CommonFunctions().navWithReplacement(
            context: context,
            widget: const SignInView(),
          ),
          child: Text(
            'Sign in',
            style: CustomTextStyles.style16Medium
                .copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
