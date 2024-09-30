import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/features/sign_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import '../../../../core/common/functions.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/text_field.dart';
import '../../../sign_in/presentation/views/sign_in_view.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              const SignUpImage(),
              Text('Sign Up', style: CustomTextStyles.style30Bold),
              Text('Welcome to ', style: CustomTextStyles.style14Light),
              const SizedBox(height: 25),
              CustomTextField(
                hintText: 'Name',
                prefixIcon: Icons.person,
                validationValue: 'Name',
                controller: signUpCubit.nameController,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                hintText: 'Email',
                prefixIcon: Icons.email,
                validationValue: 'Email',
                controller: signUpCubit.emailController,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                prefixIcon: Icons.lock,
                validationValue: 'Password',
                controller: signUpCubit.passwordController,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                prefixIcon: Icons.lock,
                validationValue: 'Confirm Password',
                controller: signUpCubit.confirmPasswordController,
              ),
              const SizedBox(height: 25),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {},
                size: size,
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

class NavToLoginWidget extends StatelessWidget {
  const NavToLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ',
            style: CustomTextStyles.style16Medium),
        GestureDetector(
          onTap: () => CommonFunctions.navWithReplacement(
            context: context,
            widget: const SignInView(),
          ),
          child: Text(
            'Sign in',
            style: CustomTextStyles.style16Medium
                .copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class SignUpImage extends StatelessWidget {
  const SignUpImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(Assets.signUpImage),
      ],
    );
  }
}
