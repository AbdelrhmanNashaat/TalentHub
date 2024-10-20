import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/core/database/cache_helper.dart';
import 'package:hire_me/core/services/services_locator.dart';
import 'package:hire_me/features/sign_in/presentation/views/sign_in_view.dart';

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
        Row(
          children: [
            Text(
              user?.name ?? '',
              style: CustomTextStyles.style16Medium.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 100),
            GestureDetector(
              onTap: () {
                getIt.get<CacheHelper>().clearData().then(
                      (v) => CommonFunctions().navWithReplacement(
                          context: context, pageName: const SignInView()),
                    );
              },
              child: Icon(
                FontAwesomeIcons.rightFromBracket,
                color: Constant.searchHintTextColor,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
