import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomAppTitle extends StatelessWidget {
  const CustomAppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Talent',
          style:
              CustomTextStyles.style24Bold.copyWith(color: Constant.iconColor),
        ),
        Text(
          'Hub',
          style: CustomTextStyles.style24Bold
              .copyWith(color: Constant.borderColor),
        ),
      ],
    );
  }
}
