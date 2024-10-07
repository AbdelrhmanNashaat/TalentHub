import 'package:flutter/material.dart';

import '../../../../../core/common/functions.dart';
import '../../../../../core/database/shared_preferences_keys.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../sign_in/data/model/user_model.dart';
import 'profile_image_widget.dart';
import 'user_name_widget.dart';

class UpperWidgetSection2 extends StatefulWidget {
  const UpperWidgetSection2({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<UpperWidgetSection2> createState() => _UpperWidgetSection2State();
}

class _UpperWidgetSection2State extends State<UpperWidgetSection2> {
  UserModel? user;
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.size.height * 0.12,
      bottom: 0,
      left: widget.size.width * 0.03,
      child: Row(
        children: [
          ProfileImageWidget(user: user),
          const SizedBox(width: 10),
          Padding(
            padding: EdgeInsets.only(top: widget.size.height * 0.034),
            child: UserNameWidget(user: user),
          ),
        ],
      ),
    );
  }

  void getUserData() async {
    user = await CommonFunctions()
        .getUserModel(key: getIt.get<SharedPreferencesKeys>().userModel);
    setState(() {});
  }
}
