import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hire_me/core/utils/text_styles.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../../../constant.dart';
import '../../../../../core/common/functions.dart';
import '../../../../../core/widgets/loading.dart';
import '../../../data/model/company_info.dart';
import '../explore_company_view.dart';
import 'app_bar.dart';
import 'available_job_view.dart';
import 'custom_card_widget.dart';

class CompanyViewBody extends StatelessWidget {
  final CompanyInfo companyInfo;
  const CompanyViewBody({super.key, required this.companyInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const CustomAppBar(
            title: 'Company Details',
          ),
          const Spacer(),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Constant.iconColor,
            elevation: 12,
            shadowColor: Constant.searchHintTextColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(11),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  CompanyLogoWidget(companyInfo: companyInfo),
                  const SizedBox(height: 4),
                  Text(
                    companyInfo.name,
                    style: CustomTextStyles.style16Medium.copyWith(
                      color: Constant.scaffoldColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: Constant.offWhiteColor,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          companyInfo.hqLocation ?? '--',
                          style: CustomTextStyles.style14Light.copyWith(
                            color: Constant.offWhiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  AboutRow(companyInfo: companyInfo),
                  const SizedBox(height: 8),
                  CustomTextWithIcon(
                    companyInfo: companyInfo,
                    title: '${companyInfo.revenue}',
                    icon: FontAwesomeIcons.dollarSign,
                  ),
                  const SizedBox(height: 8),
                  CustomTextWithIcon(
                    companyInfo: companyInfo,
                    title: companyInfo.sectors
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', ''),
                    icon: FontAwesomeIcons.gears,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Icon(
                        FontAwesomeIcons.circleInfo,
                        color: Constant.offWhiteColor,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          companyInfo.description?.trim() ?? '',
                          style: CustomTextStyles.style14Light.copyWith(
                            color: Constant.offWhiteColor,
                          ),
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomButton(companyInfo: companyInfo),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const NavToExploreButton(),
          const Spacer(),
        ],
      ),
    );
  }
}

class NavToExploreButton extends StatelessWidget {
  const NavToExploreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: HomeCardWidget(
        height: 10,
        onTap: () => CommonFunctions().navWithoutReplacement(
          context: context,
          pageName: const ExploreCompanyView(),
        ),
        title: 'Explore another company',
        textColor: Constant.offWhiteColor,
        backGroundColor: Constant.iconColor,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final CompanyInfo companyInfo;
  const CustomButton({
    super.key,
    required this.companyInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Constant.scaffoldColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            CommonFunctions().navWithReplacement(
              context: context,
              pageName: AvailableJobView(companyName: companyInfo.name.trim()),
            );
          },
          child: Center(
            child: Text(
              'Find Available Jobs in ${companyInfo.name}',
              style: CustomTextStyles.style14Light.copyWith(
                fontWeight: FontWeight.w600,
                color: Constant.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AboutRow extends StatelessWidget {
  final CompanyInfo companyInfo;
  const AboutRow({
    super.key,
    required this.companyInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        CustomTextWithIcon(
          companyInfo: companyInfo,
          title: companyInfo.founded.toString(),
          icon: FontAwesomeIcons.calendarDays,
        ),
        const Spacer(),
        CustomTextWithIcon(
          companyInfo: companyInfo,
          title: companyInfo.employees ?? '--',
          icon: FontAwesomeIcons.users,
        ),
        const Spacer(),
        CustomTextWithIcon(
          companyInfo: companyInfo,
          title: '${companyInfo.rating}',
          icon: FontAwesomeIcons.rankingStar,
        ),
        const Spacer(),
      ],
    );
  }
}

class CustomTextWithIcon extends StatelessWidget {
  final CompanyInfo companyInfo;
  final String title;
  final IconData icon;
  const CustomTextWithIcon({
    super.key,
    required this.companyInfo,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Constant.offWhiteColor,
          size: 15,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: CustomTextStyles.style14Light.copyWith(
            color: Constant.offWhiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class CompanyLogoWidget extends StatelessWidget {
  const CompanyLogoWidget({
    super.key,
    required this.companyInfo,
  });

  final CompanyInfo companyInfo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            color: Constant.circleAvatar,
            width: 2,
          ),
        ),
        child: companyInfo.logoUrl != null
            ? ClipOval(
                child: CachedNetworkImage(
                  width: 45,
                  imageUrl: companyInfo.logoUrl!,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: SizedBox(
                      height: 20,
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
      ),
    );
  }
}
