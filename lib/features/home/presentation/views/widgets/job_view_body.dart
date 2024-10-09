import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/search_job_cubit/search_job_cubit.dart';
import 'job_card.dart';
import 'job_upper_sec.dart';

class JobViewBody extends StatefulWidget {
  final String search;
  const JobViewBody({super.key, required this.search});

  @override
  State<JobViewBody> createState() => _JobViewBodyState();
}

class _JobViewBodyState extends State<JobViewBody> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SearchJobCubit>(context);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        JobViewUpperSec(formKey: _formKey, bloc: bloc),
        bloc.jobList.count > 0
            ? SliverList.builder(
                itemCount: bloc.jobList.count,
                itemBuilder: (context, index) {
                  return JobCard(
                    index: index,
                    jobList: bloc.jobList,
                  );
                },
              )
            : const SliverToBoxAdapter(
                child: Center(
                  //TODO
                  child: Text('No jobs found'),
                ),
              ),
      ],
    );
  }
}
