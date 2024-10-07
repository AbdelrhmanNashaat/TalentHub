import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../core/common/functions.dart';
import '../../manager/search_job_cubit/search_job_cubit.dart';
import '../../manager/search_job_cubit/search_job_state.dart';
import 'job_view_body.dart';
import 'search_bar.dart';

class CustomSearchJobWidget extends StatelessWidget {
  const CustomSearchJobWidget({
    super.key,
    required this.bloc,
    required this.widget,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final SearchJobCubit bloc;
  final JobViewBody widget;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchJobCubit, SearchJobState>(
      listener: (context, state) {
        if (state is SearchJobFailure) {
          CommonFunctions()
              .showToastMessage(msg: state.errorMessage, context: context);
        }
        if (state is SearchJobSuccess) {}
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: SearchTextFiled(
            fillColor: Constant.circleAvatar,
            hintTextColor: Constant.searchHintTextColor,
            isLoading: state is SearchJobLoading ? true : false,
            controller: bloc.searchController,
            hintText: widget.search,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                bloc.searchJob();
              }
            },
          ),
        );
      },
    );
  }
}
