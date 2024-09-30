import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/features/sign_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import '../../../../constant.dart';
import 'sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
        body: const SafeArea(
          child: SignUpViewBody(),
        ),
      ),
    );
  }
}
