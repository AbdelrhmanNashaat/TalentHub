import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/services/services_locator.dart';
import 'package:hire_me/features/home/data/repo/home_repo_implementation.dart';
import 'package:hire_me/features/home/presentation/manager/search_job_cubit/search_job_cubit.dart';
import 'package:hire_me/features/home/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchJobCubit>(
      create: (context) => SearchJobCubit(
        homeRepo: getIt.get<HomeRepoImplementation>(),
      ),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
        body: const SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
