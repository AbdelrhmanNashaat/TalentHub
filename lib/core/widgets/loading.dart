import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../constant.dart';

class CustomLoadingWidget extends StatelessWidget {
  final List<Color>? color;
  final Indicator? indicatorType;
  const CustomLoadingWidget({
    super.key,
    this.color,
    this.indicatorType,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      indicatorType: indicatorType ?? Indicator.ballSpinFadeLoader,
      colors: color ?? [Constant.scaffoldColor],
      strokeWidth: 1.5,
    );
  }
}
