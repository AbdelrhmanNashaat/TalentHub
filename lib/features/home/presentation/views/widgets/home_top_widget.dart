import 'package:flutter/material.dart';

import 'upper_widget_sec1.dart';
import 'upper_widget_sec2.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UpperWidgetSectionOne(size: size),
        UpperWidgetSection2(size: size),
      ],
    );
  }
}
