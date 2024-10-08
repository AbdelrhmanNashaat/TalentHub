import 'package:flutter/material.dart';

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
          child: const Icon(Icons.arrow_back_ios),
        ),
      ],
    );
  }
}
