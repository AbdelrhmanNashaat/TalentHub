import 'package:flutter/material.dart';
import 'widgets/home_middle_widget.dart';
import 'widgets/home_top_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        HomeTopWidget(size: size),
        const Spacer(),
        const HomeMiddleWidget(),
        const Spacer(),
      ],
    );
  }
}
