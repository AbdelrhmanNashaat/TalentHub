import 'package:flutter/material.dart';

import '../../../../constant.dart';
import 'chang_pass_success_view_body.dart';

class ChangPassSuccessView extends StatelessWidget {
  const ChangPassSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldColor,
      body: const SafeArea(child: ChangPassSuccessViewBody()),
    );
  }
}
