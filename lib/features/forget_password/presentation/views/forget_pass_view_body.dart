import 'package:flutter/material.dart';
import 'package:hire_me/core/utils/assets.dart';
import 'package:hire_me/core/utils/text_styles.dart';
import 'package:hire_me/features/forget_password/presentation/views/verify_code_view.dart';

import '../../../../core/common/functions.dart';
import '../../../../core/widgets/back_button.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/text_field.dart';

class ForgetPassViewBody extends StatelessWidget {
  const ForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const CustomBackWidget(),
            const SizedBox(height: 8),
            Image.asset(Assets.forgetPasswordImage),
            Center(
              child: Text(
                'A message will send to\nyour email for verification',
                style: CustomTextStyles.style24Bold,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              hintText: 'Email',
              prefixIcon: Icons.email,
              controller: TextEditingController(),
              validationValue: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: 'Send',
              onPressed: () {
                CommonFunctions().navWithoutReplacement(
                  context: context,
                  pageName: const VerifyCodeView(),
                );
                if (formKey.currentState!.validate()) {}
              },
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
