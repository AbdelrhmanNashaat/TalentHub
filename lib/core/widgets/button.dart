import 'package:flutter/material.dart';

import '../../constant.dart';
import '../utils/text_styles.dart';
import 'loading.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Size size;
  final bool isLoading;
  final double? width;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.size,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constant.circleAvatar,
        fixedSize: Size(width ?? size.width, 42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? const CustomLoadingWidget()
          : Text(text, style: CustomTextStyles.style16Medium),
    );
  }
}
