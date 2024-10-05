import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/widgets/text_field.dart';

import 'widgets/app_title.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const CustomAppTitle(),
          const Spacer(),
          Stack(
            children: [
              CustomTextField(
                hintText: 'Search for a job',
                controller: TextEditingController(),
                fillColor: Constant.borderColor,
                hintTextColor: Constant.primaryColor,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
