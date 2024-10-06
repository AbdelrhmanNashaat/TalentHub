import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'app_title.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomAppTitle(),
        const SizedBox(width: 6),
        Image.asset(
          Assets.searchEngine,
          width: 50,
        ),
      ],
    );
  }
}
