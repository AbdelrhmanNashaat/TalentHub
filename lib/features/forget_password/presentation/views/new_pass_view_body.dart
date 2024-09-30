import 'package:flutter/material.dart';
import 'package:hire_me/core/utils/assets.dart';
import 'package:hire_me/core/utils/text_styles.dart';
import 'package:hire_me/features/forget_password/presentation/views/chang_pass_success_view.dart';

import '../../../../core/common/functions.dart';
import '../../../../core/widgets/back_button.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/text_field.dart';

class NewPassViewBody extends StatefulWidget {
  const NewPassViewBody({super.key});

  @override
  State<NewPassViewBody> createState() => _NewPassViewBodyState();
}

class _NewPassViewBodyState extends State<NewPassViewBody> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const CustomBackWidget(),
            const Spacer(),
            Center(
              child: Text(
                'Update Your Password',
                style: CustomTextStyles.style16Medium.copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Image.asset(
                Assets.newPassword,
                width: size.width * 0.4,
              ),
            ),
            const SizedBox(height: 45),
            CustomTextField(
              controller: TextEditingController(),
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
              hintText: 'Confirm Password',
              obscureText: true,
              prefixIcon: Icons.lock,
              validationValue: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm Password is required';
                }
                // if (value != signUpCubit.passwordController.text) {
                //   return 'Passwords do not match';
                // }
                return null;
              },
              controller: TextEditingController(),
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: 'Update',
              onPressed: () {
                CommonFunctions().navWithReplacement(
                  context: context,
                  pageName: const ChangPassSuccessView(),
                );
                if (_formKey.currentState!.validate()) {}
              },
              size: size,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
