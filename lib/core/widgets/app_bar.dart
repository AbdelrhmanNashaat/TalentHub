import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../features/home/presentation/views/widgets/app_title.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios, color: Constant.iconColor)),
        const Spacer(),
        const CustomAppTitle(),
        const Spacer(),
      ],
    );
  }
}
