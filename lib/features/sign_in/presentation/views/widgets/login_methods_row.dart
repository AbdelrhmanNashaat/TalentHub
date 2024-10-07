import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/features/sign_in/presentation/manager/sign_in_with_facebook_cubit/sign_in_with_facebook_cubit.dart';
import 'package:hire_me/features/sign_in/presentation/manager/sign_in_with_google_cubit/sign_in_with_google_cubit.dart';
import '../../../../../core/utils/assets.dart';
import '../../manager/sign_in_with_facebook_cubit/sign_in_with_facebook_state.dart';
import '../../manager/sign_in_with_google_cubit/sign_in_with_google_state.dart';
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
        BlocConsumer<SignInWithGoogleCubit, SignInWithGoogleState>(
          listener: (context, state) {
            if (state is SignInWithGoogleSuccess) {
              CommonFunctions().navAfterLoginSuccess(context: context);
            }
          },
          builder: (context, state) {
            return LoginMethodsWidget(
              isLoading: state is SignInWithGoogleLoading ? true : false,
              onTap: () {
                BlocProvider.of<SignInWithGoogleCubit>(context)
                    .signInWithGoogle();
              },
              imagePath: Assets.google,
            );
          },
        ),
        BlocConsumer<SignInWithFacebookCubit, SignInWithFacebookState>(
          listener: (context, state) {
            if (state is SignInWithFacebookSuccess) {
              CommonFunctions().navAfterLoginSuccess(context: context);
            }
          },
          builder: (context, state) {
            return LoginMethodsWidget(
              isLoading: state is SignInWithFacebookLoading ? true : false,
              onTap: () {
                BlocProvider.of<SignInWithFacebookCubit>(context)
                    .signInWithFacebook();
              },
              imagePath: Assets.facebook,
            );
          },
        ),
        LoginMethodsWidget(
          onTap: () {},
          imagePath: Assets.twitter,
        ),
      ],
    );
  }
}
