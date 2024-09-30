import 'package:flutter/material.dart';
import 'package:hire_me/core/utils/text_styles.dart';
import 'package:hire_me/features/forget_password/presentation/views/new_pass_view.dart';
import '../../../../core/common/functions.dart';
import '../../../../core/widgets/back_button.dart';
import '../../../../core/widgets/button.dart';
import 'widgets/otp_widget.dart';
import 'widgets/resend_code_widget.dart';

class VerifyCodeViewBody extends StatelessWidget {
  const VerifyCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const CustomBackWidget(),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Text(
                  'Enter the code has been sent\nto your email',
                  style: CustomTextStyles.style24Bold.copyWith(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                const OtpWidget(),
                const SizedBox(height: 25),
                ResendCodeWidget(size: size),
                const SizedBox(height: 15),
                CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    CommonFunctions().navWithoutReplacement(
                      context: context,
                      pageName: const NewPassView(),
                    );
                  },
                  size: size,
                  width: size.width / 2,
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
