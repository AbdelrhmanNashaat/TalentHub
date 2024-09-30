import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class SignUpImage extends StatelessWidget {
  const SignUpImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(Assets.signUpImage),
      ],
    );
  }
}
