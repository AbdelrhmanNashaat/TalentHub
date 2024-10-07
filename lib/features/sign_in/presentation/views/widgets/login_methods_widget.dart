import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/widgets/loading.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginMethodsWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final bool isLoading;
  const LoginMethodsWidget({
    super.key,
    required this.onTap,
    required this.imagePath,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: isLoading
              ? SizedBox(
                  width: 42,
                  height: 42,
                  child: CustomLoadingWidget(
                    color: [Constant.circleAvatar],
                    indicatorType: Indicator.ballBeat,
                  ),
                )
              : Image.asset(
                  imagePath,
                  width: 46,
                  height: 46,
                ),
        ),
      ],
    );
  }
}
