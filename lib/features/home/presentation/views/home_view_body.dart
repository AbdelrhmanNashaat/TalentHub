import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/core/services/services_locator.dart';
import 'package:hire_me/features/sign_in/data/model/user_model.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../../core/database/shared_preferences_keys.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/loading.dart';
import 'widgets/home_middle_widget.dart';

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

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UpperWidgetSectionOne(size: size),
        UpperWidgetSection2(size: size),
      ],
    );
  }
}

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
      top: widget.size.height * 0.1,
      bottom: 0,
      left: widget.size.width * 0.03,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Constant.scaffoldColor,
            radius: 45,
            child: user?.imagePath != null
                ? CachedNetworkImage(
                    imageUrl: user!.imagePath!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: SizedBox(
                        height: 30,
                        child: CustomLoadingWidget(
                          color: [Constant.iconColor],
                          indicatorType: Indicator.ballBeat,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      FontAwesomeIcons.circleExclamation,
                      color: Colors.red,
                    ),
                  )
                : const Center(),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome,',
                style: CustomTextStyles.style16Medium,
              ),
              Text(
                user?.name ?? '',
                style: CustomTextStyles.style14Light,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getUserData() async {
    user = await CommonFunctions()
        .getUserModel(key: getIt.get<SharedPreferencesKeys>().userModel);
  }
}

class UpperWidgetSectionOne extends StatelessWidget {
  const UpperWidgetSectionOne({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Constant.circleAvatar,
            Constant.iconColor,
          ],
        ),
      ),
    );
  }
}
