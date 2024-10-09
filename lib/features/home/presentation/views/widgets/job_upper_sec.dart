import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/back_button.dart';
import '../../manager/search_job_cubit/search_job_cubit.dart';
import 'search_widget.dart';

class JobViewUpperSec extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final SearchJobCubit bloc;
  const JobViewUpperSec({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.bloc,
  }) : _formKey = formKey;

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
              CustomSearchJobWidget(bloc: bloc, formKey: _formKey),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${bloc.jobList.count} jobs found',
                      style: CustomTextStyles.style16Medium.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
