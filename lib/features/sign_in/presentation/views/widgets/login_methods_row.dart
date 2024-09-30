import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'login_methods_widget.dart';

class LoginMethodsRow extends StatelessWidget {
  const LoginMethodsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LoginMethodsWidget(
          onTap: () {},
          imagePath: Assets.google,
        ),
        LoginMethodsWidget(
          onTap: () {},
          imagePath: Assets.facebook,
        ),
        LoginMethodsWidget(
          onTap: () {},
          imagePath: Assets.twitter,
        ),
      ],
    );
  }
}
