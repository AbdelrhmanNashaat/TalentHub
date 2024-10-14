import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/core/utils/text_styles.dart';
import '../../../../core/common/functions.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/text_field.dart';
import '../manager/sign_in_with_email_and_pass_cubit/sign_in_with_email_and_pass_cubit.dart';
import '../manager/sign_in_with_email_and_pass_cubit/sign_in_with_email_and_pass_state.dart';
import 'widgets/forget_pass.dart';
import 'widgets/login_image_widget.dart';
import 'widgets/login_methods_row.dart';
import 'widgets/nav_to_sign_up.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bloc = BlocProvider.of<SignInWithEmailAndPassCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: bloc.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              LoginImageWidget(size: size),
              Text('Sign in', style: CustomTextStyles.style30Bold),
              Text('Welcome back!', style: CustomTextStyles.style14Light),
              const SizedBox(height: 25),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                prefixIcon: Icons.email,
                controller: bloc.emailController,
                validationValue: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              CustomTextField(
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Password',
                obscureText: true,
                prefixIcon: Icons.lock,
                controller: bloc.passController,
                validationValue: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              const ForgetPasswordWidget(),
              const SizedBox(height: 20),
              BlocConsumer<SignInWithEmailAndPassCubit,
                  SignInWithEmailAndPassState>(
                listener: (context, state) {
                  if (state is SignInWithEmailAndFailure) {
                    CommonFunctions().showToastMessage(
                      msg: state.errorMessage,
                      context: context,
                      color: Colors.red,
                    );
                  }
                  if (state is SignInWithEmailAndPassSuccess) {
                    CommonFunctions().navAfterLoginSuccess(context: context);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isLoading:
                        state is SignInWithEmailAndPassLoading ? true : false,
                    text: 'Log in',
                    onPressed: () {
                      if (bloc.formKey.currentState!.validate()) {
                        bloc.signIn();
                      }
                    },
                    size: size,
                  );
                },
              ),
              const SizedBox(height: 45),
              Center(
                child: Text(
                  'or sign in with',
                  style: CustomTextStyles.style16Medium.copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),
              const LoginMethodsRow(),
              const SizedBox(height: 30),
              const NavToSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
