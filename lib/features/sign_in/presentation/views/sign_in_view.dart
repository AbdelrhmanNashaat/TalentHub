import 'package:flutter/material.dart';

import '../../../../constant.dart';
import 'sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldColor,
      body: const SafeArea(child: SignInViewBody()),
    );
  }
}
