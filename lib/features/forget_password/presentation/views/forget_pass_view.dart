import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';

import 'forget_pass_view_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldColor,
      body: const SafeArea(child: ForgetPassViewBody()),
    );
  }
}
