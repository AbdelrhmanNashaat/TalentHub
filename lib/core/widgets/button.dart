import 'package:flutter/material.dart';

import '../../constant.dart';
import '../utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Size size;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constant.circleAvatar,
        fixedSize: Size(size.width, 42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: CustomTextStyles.style16Medium),
    );
  }
}
