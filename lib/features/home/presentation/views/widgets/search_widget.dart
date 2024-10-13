import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constant.dart';
import '../../manager/search_job_cubit/search_job_cubit.dart';
import 'search_bar.dart';

class CustomSearchJobWidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  const CustomSearchJobWidget({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    final SearchJobCubit bloc = BlocProvider.of<SearchJobCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SearchTextFiled(
        fillColor: Constant.circleAvatar,
        hintTextColor: Constant.searchHintTextColor,
        controller: bloc.searchController,
        hintText: bloc.searchController.text,
        onTap: () {
          if (_formKey.currentState!.validate()) {
            bloc.searchJob();
          }
        },
      ),
    );
  }
}
