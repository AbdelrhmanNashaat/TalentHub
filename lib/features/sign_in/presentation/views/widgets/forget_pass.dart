import 'package:flutter/material.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/features/forget_password/presentation/views/forget_pass_view.dart';

import '../../../../../core/utils/text_styles.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => CommonFunctions().navWithoutReplacement(
            context: context,
            pageName: const ForgetPassView(),
          ),
          child: Text(
            'Forgot password?',
            style: CustomTextStyles.style16Medium.copyWith(
              color: Colors.blue,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
