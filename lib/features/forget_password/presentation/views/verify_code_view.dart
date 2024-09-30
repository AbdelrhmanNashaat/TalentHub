import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/features/forget_password/presentation/views/verify_code_view_body.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldColor,
      body: const SafeArea(child: VerifyCodeViewBody()),
    );
  }
}
