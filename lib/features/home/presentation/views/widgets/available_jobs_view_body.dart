import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/back_button.dart';
import '../../manager/company_job_cubit/company_job_cubit.dart';
import '../../manager/company_job_cubit/company_job_state.dart';
import 'job_view_body.dart';
import 'search_widget.dart';

class AvailableJobsViewBody extends StatelessWidget {
  const AvailableJobsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<CompanyJobCubit, CompanyJobState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CompanyJobViewUpperSec(
                state: state,
                jobCount:
                    state is CompanyJobSuccess ? state.companyJobs.count : 0,
              ),
              if (state is CompanyJobLoading)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => const Skeletonizer(
                      enabled: true,
                      child: JobCardSkeleton(),
                    ),
                    childCount: 4,
                  ),
                )
              else if (state is CompanyJobSuccess &&
                  state.companyJobs.count > 0)
                SliverList.builder(
                  itemCount: state.companyJobs.count,
                  itemBuilder: (context, index) {
                    final job = state.companyJobs.hits[index];
                    return JobCard(
                      title: job.title,
                      location: job.location,
                    );
                  },
                )
              else if (state is CompanyJobSuccess &&
                  state.companyJobs.count == 0)
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'No jobs found',
                      style: CustomTextStyles.style24Bold,
                    ),
                  ),
                )
              else
                const SliverToBoxAdapter(
                  child: Center(
                    child: Text('Something went wrong'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String location;

  const JobCard({
    super.key,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.grey[200],
      elevation: 12,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(11)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyles.style16Medium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: CustomTextStyles.style16Medium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyJobViewUpperSec extends StatefulWidget {
  final CompanyJobState state;
  final int jobCount;

  const CompanyJobViewUpperSec({
    super.key,
    required this.state,
    required this.jobCount,
  });

  @override
  State<CompanyJobViewUpperSec> createState() => _CompanyJobViewUpperSecState();
}

class _CompanyJobViewUpperSecState extends State<CompanyJobViewUpperSec> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const CustomBackWidget(),
            const SizedBox(height: 20),
            CustomSearchJobWidget(
              formKey: _formKey,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<CompanyJobCubit>(context).getCompanyJobs(
                      companyName: searchController.text.trim());
                }
              },
              searchController: searchController,
              hintText: 'Search for jobs',
            ),
            const SizedBox(height: 8),
            if (widget.state is CompanyJobSuccess && widget.jobCount > 0)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${widget.jobCount} jobs found',
                    style: CustomTextStyles.style16Medium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
