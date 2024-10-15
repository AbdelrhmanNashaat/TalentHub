import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/features/home/data/model/company_info.dart';
import '../../../../constant.dart';
import '../../../../core/services/services_locator.dart';
import '../../data/repo/home_repo_implementation.dart';
import '../manager/company_job_cubit/company_job_cubit.dart';
import 'widgets/company_view_body.dart';

class CompanyView extends StatelessWidget {
  final CompanyInfo companyInfo;
  const CompanyView({super.key, required this.companyInfo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyJobCubit>(
      create: (context) => CompanyJobCubit(
        homeRepo: getIt.get<HomeRepoImplementation>(),
      )..getCompanyJobs(companyName: companyInfo.name),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
        body: SafeArea(
          child: CompanyViewBody(
            companyInfo: companyInfo,
          ),
        ),
      ),
    );
  }
}
