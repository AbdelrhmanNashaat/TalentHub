import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/features/home/presentation/views/widgets/job_view_body.dart';
import '../../../../core/services/services_locator.dart';
import '../../data/repo/home_repo_implementation.dart';
import '../manager/search_job_cubit/search_job_cubit.dart';

class JobView extends StatelessWidget {
  final String query;
  const JobView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchJobCubit>(
      create: (context) => SearchJobCubit(
        homeRepo: getIt.get<HomeRepoImplementation>(),
      )
        ..searchController.text = query
        ..searchJob(),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
        body: const SafeArea(
          child: JobViewBody(),
        ),
      ),
    );
  }
}
