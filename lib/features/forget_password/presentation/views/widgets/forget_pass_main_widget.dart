import 'package:flutter/material.dart';

import '../../../../../core/common/functions.dart';
import '../../../../../core/widgets/button.dart';
import '../../../../../core/widgets/text_field.dart';
import '../verify_code_view.dart';

class ForgetPassMainWidget extends StatelessWidget {
  const ForgetPassMainWidget({
    super.key,
    required this.formKey,
    required this.size,
  });

  final GlobalKey<FormState> formKey;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
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
    );
  }
}
