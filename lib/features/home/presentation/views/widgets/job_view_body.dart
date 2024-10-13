import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/constant.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../manager/search_job_cubit/search_job_cubit.dart';
import '../../manager/search_job_cubit/search_job_state.dart';
import 'job_card.dart';
import 'job_upper_sec.dart';

class JobViewBody extends StatelessWidget {
  const JobViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchJobCubit, SearchJobState>(
      builder: (context, state) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            JobViewUpperSec(
              state: state,
              jobCount: state is SearchJobSuccess ? state.jobList.count : 0,
            ),
            if (state is SearchJobLoading)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const Skeletonizer(
                    enabled: true,
                    child: JobCardSkeleton(),
                  ),
                  childCount: 6,
                ),
              )
            else if (state is SearchJobSuccess && state.jobList.count > 0)
              SliverList.builder(
                itemCount: state.jobList.count,
                itemBuilder: (context, index) {
                  return JobCard(
                    index: index,
                    jobList: state.jobList,
                  );
                },
              )
            else if (state is SearchJobSuccess && state.jobList.count == 0)
              const SliverToBoxAdapter(
                child: Center(
                  child: Text('No jobs found'),
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
    );
  }
}

class JobCardSkeleton extends StatelessWidget {
  const JobCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      color: Constant.iconColor,
      elevation: 12,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(11),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            _buildPlaceholder(height: 20, width: 150),
            const SizedBox(height: 6),
            _buildPlaceholder(height: 18, width: 100),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                _buildCirclePlaceholder(),
                const SizedBox(width: 6),
                _buildPlaceholder(height: 14, width: 40),
                const SizedBox(width: 25),
                _buildCirclePlaceholder(),
                const SizedBox(width: 6),
                _buildPlaceholder(height: 14, width: 80),
                const SizedBox(width: 25),
                _buildCirclePlaceholder(),
                const SizedBox(width: 8),
                _buildPlaceholder(height: 14, width: 60),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildPlaceholder(height: 14, width: 70),
                  const Spacer(),
                  _buildPlaceholder(height: 14, width: 60),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildPlaceholder(height: 26, width: 80),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Constant.navBarColor,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildCirclePlaceholder() {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: Constant.navBarColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
