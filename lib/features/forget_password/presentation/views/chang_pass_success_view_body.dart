import 'package:flutter/material.dart';

import '../../../../core/common/functions.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/back_button.dart';
import '../../../../core/widgets/button.dart';
import '../../../sign_in/presentation/views/sign_in_view.dart';

class ChangPassSuccessViewBody extends StatelessWidget {
  const ChangPassSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const CustomBackWidget(),
          const Spacer(),
          Center(
            child: Text(
              'Password has been updated',
              style: CustomTextStyles.style16Medium.copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Image.asset(Assets.updatePassword),
          ),
          const SizedBox(height: 15),
          Center(
            child: CustomButton(
              text: 'Sign in',
              onPressed: () {
                CommonFunctions().navWithReplacement(
                  context: context,
                  pageName: const SignInView(),
                );
              },
              size: size,
              width: size.width / 2,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
