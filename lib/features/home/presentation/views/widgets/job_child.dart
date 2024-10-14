import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../data/model/job_search_response_model.dart';
import 'apply_button.dart';

class JobChild extends StatelessWidget {
  const JobChild({
    super.key,
    required this.jobList,
    required this.index,
  });

  final JobSearchResponse jobList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          jobList.hits[index].title,
          style: CustomTextStyles.style16Medium.copyWith(
            fontWeight: FontWeight.w500,
            color: Constant.scaffoldColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          jobList.hits[index].companyName,
          style: CustomTextStyles.style16Medium.copyWith(
            fontWeight: FontWeight.w500,
            color: Constant.scaffoldColor,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Icon(
              FontAwesomeIcons.calendarDays,
              color: Constant.offWhiteColor,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              '40 hrs',
              style: CustomTextStyles.style16Medium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Constant.offWhiteColor,
              ),
            ),
            const SizedBox(width: 20),
            Icon(
              FontAwesomeIcons.locationDot,
              color: Constant.offWhiteColor,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              jobList.hits[index].location,
              style: CustomTextStyles.style16Medium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Constant.offWhiteColor,
              ),
            ),
            const SizedBox(width: 20),
            Icon(
              FontAwesomeIcons.clock,
              color: Constant.offWhiteColor,
              size: 16,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Full Time',
                style: CustomTextStyles.style16Medium.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Constant.offWhiteColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '70 - 90 \$/hr',
                style: CustomTextStyles.style16Medium.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Constant.offWhiteColor,
                ),
              ),
              const Spacer(),
              Text(
                '2 days ago',
                style: CustomTextStyles.style16Medium.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Constant.offWhiteColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ApplyWidget(
              count: jobList.count,
              index: index,
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
