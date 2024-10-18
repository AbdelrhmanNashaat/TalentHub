import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/features/home/presentation/manager/company_job_cubit/company_job_cubit.dart';
import 'package:hire_me/features/home/presentation/views/widgets/available_jobs_view_body.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../data/repo/home_repo_implementation.dart';

class AvailableJobView extends StatelessWidget {
  final String companyName;
  const AvailableJobView({super.key, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyJobCubit(
        homeRepo: getIt.get<HomeRepoImplementation>(),
      )..getCompanyJobs(companyName: companyName),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
        body: const SafeArea(child: AvailableJobsViewBody()),
      ),
    );
  }
}
