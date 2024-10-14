import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/features/home/presentation/views/widgets/explore_company_view_body.dart';
import '../../../../constant.dart';
import '../../../../core/services/services_locator.dart';
import '../../data/repo/home_repo_implementation.dart';
import '../manager/cubit/search_for_company_cubit.dart';

class ExploreCompanyView extends StatelessWidget {
  const ExploreCompanyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchForCompanyCubit>(
      create: (context) => SearchForCompanyCubit(
        homeRepo: getIt.get<HomeRepoImplementation>(),
      ),
      child: Scaffold(
        backgroundColor: Constant.scaffoldColor,
        body: const SafeArea(child: ExploreCompanyViewBody()),
      ),
    );
  }
}
