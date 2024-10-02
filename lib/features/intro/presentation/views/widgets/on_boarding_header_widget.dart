import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomOnBoardingHeaderWidget extends StatelessWidget {
  const CustomOnBoardingHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Assets.onBoarding1Image1),
        Center(
          child: Text(
            'Find Your Dream Job',
            style: CustomTextStyles.style30Bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              Assets.onBoarding1Image2,
            ),
          ],
        ),
      ],
    );
  }
}
