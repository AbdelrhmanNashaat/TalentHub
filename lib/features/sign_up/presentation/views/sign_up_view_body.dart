import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/features/sign_in/presentation/views/sign_in_view.dart';
import 'package:hire_me/features/sign_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/text_field.dart';
import '../manager/sign_up_cubit/sign_up_state.dart';
import 'widgets/nav_to_login.dart';
import 'widgets/sign_up_image.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Form(
          key: signUpCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              const SignUpImage(),
              Text('Sign Up', style: CustomTextStyles.style30Bold),
              Text('Welcome to ', style: CustomTextStyles.style14Light),
              const SizedBox(height: 25),
              CustomTextField(
                keyboardType: TextInputType.name,
                hintText: 'Name',
                prefixIcon: Icons.person,
                validationValue: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                controller: signUpCubit.nameController,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                prefixIcon: Icons.email,
                validationValue: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  final emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                controller: signUpCubit.emailController,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                keyboardType: TextInputType.visiblePassword,
                controller: signUpCubit.passwordController,
                hintText: 'password',
                prefixIcon: Icons.lock,
                obscureText: true,
                validationValue: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain at least one number';
                  }
                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              CustomTextField(
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Confirm Password',
                obscureText: true,
                prefixIcon: Icons.lock,
                validationValue: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password is required';
                  }
                  if (value != signUpCubit.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                controller: signUpCubit.confirmPasswordController,
              ),
              const SizedBox(height: 25),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    CommonFunctions commonFunctions = CommonFunctions();
                    commonFunctions.showToastMessage(
                      msg: 'Please verify your email.',
                      context: context,
                    );
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        if (context.mounted) {
                          commonFunctions.navWithReplacement(
                            context: context,
                            pageName: const SignInView(),
                          );
                        }
                      },
                    );
                  }
                  if (state is SignUpFailure) {
                    String errorMessage = state.errorMessage;
                    log(errorMessage);
                    switch (errorMessage) {
                      case 'Email already in use.':
                        errorMessage = 'Email already in use';
                        break;
                      case 'The password is too weak.':
                        errorMessage = 'Password is too weak';
                        break;
                      default:
                        errorMessage =
                            'An error occurred, please try again later!';
                    }
                    CommonFunctions().showToastMessage(
                      msg: errorMessage,
                      context: context,
                      color: Colors.red,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is SignUpLoading ? true : false,
                    text: 'Sign Up',
                    onPressed: () {
                      if (signUpCubit.formKey.currentState!.validate()) {
                        signUpCubit.signUp();
                      }
                    },
                    size: size,
                  );
                },
              ),
              const SizedBox(height: 25),
              const NavToLoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
