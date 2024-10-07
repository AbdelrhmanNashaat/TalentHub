import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/features/home/presentation/views/widgets/job_view_body.dart';

import '../../../../core/services/services_locator.dart';
import '../../data/model/job_search_response_model.dart';
import '../../data/repo/home_repo_implementation.dart';
import '../manager/search_job_cubit/search_job_cubit.dart';

class JobView extends StatelessWidget {
  final JobSearchResponse jobList;
  final String search;
  const JobView({super.key, required this.jobList, required this.search});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchJobCubit>(
      create: (context) => SearchJobCubit(
        homeRepo: getIt.get<HomeRepoImplementation>(),
      ),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
        body: SafeArea(
          child: JobViewBody(
            jobList: jobList,
            search: search,
          ),
        ),
      ),
    );
  }
}
