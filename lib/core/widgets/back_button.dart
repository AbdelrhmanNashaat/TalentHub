import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';

class CustomBackWidget extends StatelessWidget {
  const CustomBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Constant.primaryColor,
          ),
        ),
      ],
    );
  }
}
