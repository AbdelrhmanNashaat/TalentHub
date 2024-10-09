import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/core/utils/assets.dart';
import 'package:hire_me/features/home/presentation/manager/search_job_cubit/search_job_cubit.dart';
import '../../../../../core/utils/text_styles.dart';
import '../manager/search_job_cubit/search_job_state.dart';
import 'widgets/search_bar.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SearchJobCubit>(context);
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          Assets.searchJobBg,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back_ios,
                          color: Constant.primaryColor),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'Find the best jobs in Egypt',
                  style: CustomTextStyles.style20Medium.copyWith(
                    color: Constant.scaffoldColor,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Searching for vacancies & career opportunities? TalentHub helps\nyou in your job search in Egypt',
                  style: CustomTextStyles.style16Medium.copyWith(
                    color: Constant.searchHintTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                BlocConsumer<SearchJobCubit, SearchJobState>(
                  listener: (context, state) {
                    if (state is SearchJobFailure) {
                      CommonFunctions().showToastMessage(
                          msg: state.errorMessage, context: context);
                    }
                    if (state is SearchJobSuccess) {
                      bloc.searchController.clear();
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SearchTextFiled(
                        isLoading: state is SearchJobLoading ? true : false,
                        controller: bloc.searchController,
                        hintText: 'Search jobs (eg. Software Engineer)',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            bloc.searchJob();
                          }
                        },
                      ),
                    );
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
