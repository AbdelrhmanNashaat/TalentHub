import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/constant.dart';

import '../manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'forget_pass_view_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPassCubit>(
      create: (context) => ForgetPassCubit(),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
        body: const SafeArea(child: ForgetPassViewBody()),
      ),
    );
  }
}
