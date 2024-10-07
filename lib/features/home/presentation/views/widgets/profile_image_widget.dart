import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/loading.dart';
import '../../../../sign_in/data/model/user_model.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.user,
  });

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Constant.scaffoldColor,
      radius: 45,
      child: user?.imagePath != null
          ? ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: user!.imagePath!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
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
              ),
            )
          : const Center(),
    );
  }
}
