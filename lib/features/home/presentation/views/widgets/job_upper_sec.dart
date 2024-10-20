import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/features/home/presentation/manager/search_job_cubit/search_job_cubit.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/back_button.dart';
import '../../manager/search_job_cubit/search_job_state.dart';
import 'search_widget.dart';

class JobViewUpperSec extends StatefulWidget {
  final SearchJobState state;
  final int jobCount;
  const JobViewUpperSec(
      {super.key, required this.state, required this.jobCount});

  @override
  State<JobViewUpperSec> createState() => _JobViewUpperSecState();
}

class _JobViewUpperSecState extends State<JobViewUpperSec> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CustomBackWidget(),
              const SizedBox(height: 20),
              CustomSearchJobWidget(
                formKey: _formKey,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<SearchJobCubit>(context).searchJob();
                  }
                },
                searchController:
                    BlocProvider.of<SearchJobCubit>(context).searchController,
                hintText: 'Search for jobs',
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.state is SearchJobSuccess && widget.jobCount > 0
                        ? Text(
                            '${widget.jobCount} jobs found',
                            style: CustomTextStyles.style16Medium.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
