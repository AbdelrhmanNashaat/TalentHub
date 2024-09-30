import 'package:flutter/material.dart';
import 'package:hire_me/core/utils/assets.dart';
import 'package:hire_me/core/utils/text_styles.dart';
import '../../../../core/widgets/back_button.dart';
import 'widgets/forget_pass_main_widget.dart';

class ForgetPassViewBody extends StatelessWidget {
  const ForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
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
            ForgetPassMainWidget(formKey: formKey, size: size),
          ],
        ),
      ),
    );
  }
}
