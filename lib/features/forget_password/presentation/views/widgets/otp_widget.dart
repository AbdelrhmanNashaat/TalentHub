import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../constant.dart';

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
