import 'package:flutter/material.dart';

class LoginMethodsWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  const LoginMethodsWidget({
    super.key,
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
