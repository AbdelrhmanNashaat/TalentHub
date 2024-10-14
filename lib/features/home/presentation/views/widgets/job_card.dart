import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../data/model/job_search_response_model.dart';
import 'job_child.dart';

class JobCard extends StatelessWidget {
  final JobSearchResponse jobList;
  final int index;
  const JobCard({
    super.key,
    required this.index,
    required this.jobList,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: JobChild(jobList: jobList, index: index),
      ),
    );
  }
}
