import 'package:flutter/material.dart';

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
