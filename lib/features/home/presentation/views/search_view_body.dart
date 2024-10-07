import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import 'widgets/search_bar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          Assets.searchJobBg,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.arrow_back_ios,
                        color: Constant.primaryColor),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                'Find the best jobs in Egypt',
                style: CustomTextStyles.style20Medium.copyWith(
                  color: Constant.scaffoldColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Searching for vacancies & career opportunities? TalentHub helps\nyou in your job search in Egypt',
                style: CustomTextStyles.style16Medium.copyWith(
                  color: Constant.searchHintTextColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              SearchTextFiled(
                controller: TextEditingController(),
                hintText: 'Search jobs (eg. Software Engineer)',
                onTap: () {},
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
