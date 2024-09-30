import 'package:flutter/material.dart';
import 'package:hire_me/core/utils/text_styles.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/text_field.dart';
import 'widgets/forget_pass.dart';
import 'widgets/login_image_widget.dart';
import 'widgets/login_methods_row.dart';
import 'widgets/nav_to_sign_up.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            LoginImageWidget(size: size),
            Text('Sign in', style: CustomTextStyles.style30Bold),
            Text('Welcome back!', style: CustomTextStyles.style14Light),
            const SizedBox(height: 25),
            CustomTextField(
              hintText: 'Email',
              prefixIcon: Icons.email,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              hintText: 'Password',
              obscureText: true,
              prefixIcon: Icons.lock,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 15),
            const ForgetPasswordWidget(),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Log in',
              onPressed: () {},
              size: size,
            ),
            const SizedBox(height: 45),
            Center(
                child: Text('or sign in with',
                    style: CustomTextStyles.style16Medium)),
            const SizedBox(height: 20),
            const LoginMethodsRow(),
            const SizedBox(height: 25),
            const NavToSignUp(),
          ],
        ),
      ),
    );
  }
}
