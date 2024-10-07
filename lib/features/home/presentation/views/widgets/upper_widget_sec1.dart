import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class UpperWidgetSectionOne extends StatelessWidget {
  const UpperWidgetSectionOne({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Constant.circleAvatar,
            Constant.iconColor,
          ],
        ),
      ),
    );
  }
}
