import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class LoginImageWidget extends StatelessWidget {
  const LoginImageWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          Assets.loginImage,
          width: size.width * 0.5,
        ),
      ],
    );
  }
}
