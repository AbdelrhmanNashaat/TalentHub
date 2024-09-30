import 'package:flutter/material.dart';

import '../../../../constant.dart';
import 'new_pass_view_body.dart';

class NewPassView extends StatelessWidget {
  const NewPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldColor,
      body: const SafeArea(child: NewPassViewBody()),
    );
  }
}
