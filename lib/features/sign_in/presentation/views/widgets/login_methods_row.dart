import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/core/services/services_locator.dart';
import 'package:hire_me/features/home/presentation/views/search_view.dart';
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
          onTap: () async {
            UserCredential? userCredential =
                await getIt.get<FireBaseServices>().loginWithGoogle();
            if (userCredential != null && context.mounted) {
              CommonFunctions().navWithReplacement(
                context: context,
                pageName: const SearchView(),
              );
            }
          },
          imagePath: Assets.google,
        ),
        LoginMethodsWidget(
          onTap: () async {
            UserCredential? userCredential =
                await getIt.get<FireBaseServices>().loginWithFacebook();
            if (userCredential != null && context.mounted) {
              CommonFunctions().navWithReplacement(
                context: context,
                pageName: const SearchView(),
              );
            }
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
