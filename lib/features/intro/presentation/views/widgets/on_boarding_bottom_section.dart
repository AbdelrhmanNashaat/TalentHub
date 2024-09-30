import 'package:flutter/material.dart';
import 'on_boarding_skip_button.dart';
import 'on_boarding_text_button.dart';

class OnBoardingBottomSection extends StatefulWidget {
  final PageController controller;
  const OnBoardingBottomSection({
    super.key,
    required this.controller,
  });

  @override
  OnBoardingBottomSectionState createState() => OnBoardingBottomSectionState();
}

class OnBoardingBottomSectionState extends State<OnBoardingBottomSection> {
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updatePage);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updatePage);
    super.dispose();
  }

  void _updatePage() {
    if (mounted) {
      setState(() {
        isLastPage = widget.controller.page?.toInt() == 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          !isLastPage ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
      children: [
        if (!isLastPage) const OnBoardingTextButton(),
        OnBoardingNextButtonButton(controller: widget.controller),
      ],
    );
  }
}
