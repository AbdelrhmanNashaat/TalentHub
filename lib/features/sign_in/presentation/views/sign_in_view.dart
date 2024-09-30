import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constant.dart';
import '../manager/sign_in_with_email_and_pass_cubit/sign_in_with_email_and_pass_cubit.dart';
import 'sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInWithEmailAndPassCubit>(
      create: (context) => SignInWithEmailAndPassCubit(),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
        body: const SafeArea(child: SignInViewBody()),
      ),
    );
  }
}
