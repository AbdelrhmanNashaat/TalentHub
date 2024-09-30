import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SignUpImage(),
              ],
            ),
            Text('Sign Up', style: CustomTextStyles.style30Bold),
            Text('Welcome to ', style: CustomTextStyles.style14Light),
            const SizedBox(height: 25),
            const CustomTextField(
              hintText: 'Name',
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 25),
            const CustomTextField(
              hintText: 'Email',
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 25),
            const CustomTextField(
              hintText: 'Password',
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 25),
            const CustomTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: 'Sign Up',
              onPressed: () {},
              size: size,
            ),
            const SizedBox(height: 25),
            Row(
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
                    style: CustomTextStyles.style16Medium.copyWith(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpImage extends StatelessWidget {
  const SignUpImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.signUpImage);
  }
}
