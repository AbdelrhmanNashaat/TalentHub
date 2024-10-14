import 'package:flutter/material.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/features/home/presentation/views/search_view.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../explore_company_view.dart';
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
            onTap: () => CommonFunctions().navWithoutReplacement(
              context: context,
              pageName: const SearchView(),
            ),
            title: 'Search for a Job',
            textColor: Constant.primaryColor,
            backGroundColor: Constant.circleAvatar,
          ),
          const SizedBox(height: 15),
          HomeCardWidget(
            onTap: () => CommonFunctions().navWithoutReplacement(
              context: context,
              pageName: const ExploreCompanyView(),
            ),
            title: 'Explore Companies',
            textColor: Constant.scaffoldColor,
            backGroundColor: Constant.iconColor,
          ),
          const SizedBox(height: 15),
          HomeCardWidget(
            onTap: () {},
            title: 'Search for a Job in specific Company',
            textColor: Constant.scaffoldColor,
            backGroundColor: Constant.primaryColor,
          ),
        ],
      ),
    );
  }
}
