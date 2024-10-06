import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import 'custom_card_widget.dart';
import 'home_title.dart';

class HomeMiddleWidget extends StatelessWidget {
  const HomeMiddleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const HomeTitle(),
          Text(
            'Choose from our features',
            style: CustomTextStyles.style16Medium.copyWith(
              fontWeight: FontWeight.w600,
              color: Constant.iconColor,
            ),
          ),
          const SizedBox(height: 25),
          HomeCardWidget(
            title: 'Search for a Job',
            textColor: Constant.primaryColor,
            backGroundColor: Constant.circleAvatar,
          ),
          const SizedBox(height: 15),
          HomeCardWidget(
            title: 'Explore Companies',
            textColor: Constant.scaffoldColor,
            backGroundColor: Constant.iconColor,
          ),
          const SizedBox(height: 15),
          HomeCardWidget(
            title: 'Search for a Job in specific Company',
            textColor: Constant.scaffoldColor,
            backGroundColor: Constant.primaryColor,
          ),
        ],
      ),
    );
  }
}
