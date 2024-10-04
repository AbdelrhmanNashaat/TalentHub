import 'package:flutter/material.dart';
import 'package:hire_me/constant.dart';

import '../../../../core/widgets/custom_nav_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldColor,
      bottomNavigationBar: const CustomBottomNavBarWidget(),
    );
  }
}
