import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backGroundColor;
  final VoidCallback onTap;
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.textColor,
    required this.backGroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
      ),
    );
  }
}
