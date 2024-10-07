import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/loading.dart';
import '../../../../../core/widgets/text_field.dart';

class SearchTextFiled extends StatelessWidget {
  final bool isLoading;
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onTap;
  const SearchTextFiled({
    super.key,
    this.isLoading = false,
    required this.controller,
    required this.hintText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textStyle: CustomTextStyles.style16Medium.copyWith(
        fontSize: 13,
        color: Constant.iconColor,
      ),
      hintText: hintText,
      controller: controller,
      fillColor: Constant.scaffoldColor,
      hintTextColor: Constant.primaryColor,
      suffixIcon: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Constant.iconColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isLoading
              ? Container(
                  height: 6,
                  width: 6,
                  padding: const EdgeInsets.all(8),
                  child: CustomLoadingWidget(
                    indicatorType: Indicator.ballBeat,
                    color: [Constant.scaffoldColor],
                  ),
                )
              : Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Constant.scaffoldColor,
                  size: 22,
                ),
        ),
      ),
    );
  }
}
