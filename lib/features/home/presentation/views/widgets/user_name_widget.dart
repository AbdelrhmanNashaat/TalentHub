import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../sign_in/data/model/user_model.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({
    super.key,
    required this.user,
  });

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome,',
          style: CustomTextStyles.style20Medium.copyWith(
            fontSize: 18,
          ),
        ),
        Text(
          user?.name ?? '',
          style: CustomTextStyles.style16Medium.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
