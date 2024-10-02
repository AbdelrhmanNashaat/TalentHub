import 'package:flutter/material.dart';
import 'package:hire_me/core/services/services_locator.dart';
import '../../../../../core/services/fire_base_services.dart';
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
          onTap: () {
            getIt.get<FireBaseServices>().loginWithGoogle();
          },
          imagePath: Assets.google,
        ),
        LoginMethodsWidget(
          onTap: () {
            getIt.get<FireBaseServices>().loginWithFacebook();
          },
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
