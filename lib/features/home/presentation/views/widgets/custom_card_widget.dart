import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backGroundColor;
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.textColor,
    required this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backGroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      shadowColor: Constant.circleAvatar,
      elevation: 8,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            title,
            style: CustomTextStyles.style16Medium.copyWith(
              fontWeight: FontWeight.w800,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
