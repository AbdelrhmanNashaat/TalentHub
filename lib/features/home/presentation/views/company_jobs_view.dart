import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/services/services_locator.dart';
import 'package:hire_me/features/home/presentation/manager/company_job_cubit/company_job_cubit.dart';

import '../../data/repo/home_repo.dart';

class CompanyJobsView extends StatelessWidget {
  const CompanyJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyJobCubit>(
      create: (context) => CompanyJobCubit(
        homeRepo: getIt<HomeRepo>(),
      ),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
      ),
    );
  }
}
