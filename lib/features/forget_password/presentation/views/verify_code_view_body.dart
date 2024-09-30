import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hire_me/core/utils/text_styles.dart';
import 'package:timer_button/timer_button.dart';

import '../../../../constant.dart';
import '../../../../core/common/functions.dart';
import '../../../../core/widgets/back_button.dart';
import '../../../../core/widgets/button.dart';
import 'verify_code_view.dart';

class VerifyCodeViewBody extends StatelessWidget {
  const VerifyCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const CustomBackWidget(),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Text(
                  'Enter the code has been sent\nto your email',
                  style: CustomTextStyles.style24Bold.copyWith(
                    fontSize: 22,
                  ),
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
                      pageName: const VerifyCodeView(),
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

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: DottedBorder(
        color: Constant.borderColor,
        radius: const Radius.circular(8),
        strokeWidth: 3,
        dashPattern: const [
          20,
          8,
        ],
        child: SizedBox(
          width: size.width * 0.4,
          height: 42,
          child: TimerButton.builder(
            resetTimerOnPressed: true,
            builder: (context, timeLeft) {
              return Center(
                child: Text(
                  timeLeft > 0 ? "try again in $timeLeft" : "Resend Code",
                  style: CustomTextStyles.style16Medium.copyWith(
                    fontSize: 14,
                    color: timeLeft > 0 ? Colors.red : Constant.iconColor,
                  ),
                ),
              );
            },
            onPressed: () {},
            timeOutInSeconds: 60,
          ),
        ),
      ),
    );
  }
}

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      borderWidth: 2,
      fieldWidth: 60,
      borderRadius: BorderRadius.circular(8),
      numberOfFields: 4,
      enabledBorderColor: Constant.borderColor,
      focusedBorderColor: Constant.iconColor,
      showFieldAsBox: true,
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) {},
    );
  }
}
