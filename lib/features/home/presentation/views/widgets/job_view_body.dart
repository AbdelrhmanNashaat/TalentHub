import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/utils/text_styles.dart';
import '../../../../../core/widgets/back_button.dart';
import '../../../data/model/job_search_response_model.dart';
import '../../manager/search_job_cubit/search_job_cubit.dart';
import 'search_widget.dart';

class JobViewBody extends StatefulWidget {
  final JobSearchResponse jobList;
  final String search;
  const JobViewBody({super.key, required this.jobList, required this.search});

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
        JobViewUpperSec(formKey: _formKey, bloc: bloc, widget: widget),
        SliverList.builder(
          itemCount: widget.jobList.count,
          itemBuilder: (context, index) {
            return JobCard(
              index: index,
              jobList: widget.jobList,
            );
          },
        ),
      ],
    );
  }
}

class JobViewUpperSec extends StatelessWidget {
  const JobViewUpperSec({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.bloc,
    required this.widget,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final SearchJobCubit bloc;
  final JobViewBody widget;

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
                  bloc: bloc, widget: widget, formKey: _formKey),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.jobList.count} jobs found',
                      style: CustomTextStyles.style16Medium.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final JobSearchResponse jobList;
  final int index;
  const JobCard({
    super.key,
    required this.index,
    required this.jobList,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: Constant.iconColor,
      elevation: 8,
      shadowColor: Constant.searchHintTextColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Job Title : ${jobList.hits[index].title}',
              style: CustomTextStyles.style16Medium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Constant.scaffoldColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Company : ${jobList.hits[index].companyName}',
              style: CustomTextStyles.style16Medium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Constant.scaffoldColor,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Icon(
                  FontAwesomeIcons.calendarDays,
                  color: Constant.scaffoldColor,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  jobList.hits[index].location,
                  style: CustomTextStyles.style16Medium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constant.offWhiteColor,
                  ),
                ),
                const SizedBox(width: 25),
                Icon(
                  FontAwesomeIcons.locationDot,
                  color: Constant.scaffoldColor,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  jobList.hits[index].location,
                  style: CustomTextStyles.style16Medium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constant.offWhiteColor,
                  ),
                ),
                const SizedBox(width: 25),
                Icon(
                  FontAwesomeIcons.clock,
                  color: Constant.scaffoldColor,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  'Full Time',
                  style: CustomTextStyles.style16Medium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constant.offWhiteColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Salary: 70 - 90 \$/hr',
              style: CustomTextStyles.style16Medium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Constant.offWhiteColor,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Posted at : 2 days ago',
                  style: CustomTextStyles.style16Medium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constant.offWhiteColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
