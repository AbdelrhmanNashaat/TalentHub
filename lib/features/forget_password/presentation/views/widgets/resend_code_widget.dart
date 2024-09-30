import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:timer_button/timer_button.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

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
                    color: timeLeft > 0 ? Colors.red : Constant.primaryColor,
                  ),
                ),
              );
            },
            onPressed: () {},
            timeOutInSeconds: 30,
          ),
        ),
      ),
    );
  }
}
