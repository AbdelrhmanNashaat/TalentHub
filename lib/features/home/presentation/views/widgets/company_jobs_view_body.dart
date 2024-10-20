import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/core/utils/assets.dart';
import 'package:hire_me/features/home/presentation/views/widgets/available_job_view.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/back_button.dart';
import '../../manager/company_job_cubit/company_job_cubit.dart';
import 'search_bar.dart';

class CompanyJobsViewBody extends StatelessWidget {
  const CompanyJobsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CompanyJobCubit>(context);
    final TextEditingController searchController = TextEditingController();
    return Form(
      key: bloc.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                const CustomBackWidget(),
                const Spacer(),
                Center(
                  child: Text(
                    'Company Jobs',
                    style: CustomTextStyles.style20Medium.copyWith(
                      color: Constant.primaryColor,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.hiring,
                  width: 150,
                ),
              ],
            ),
            Text('Find available jobs in your dream company',
                style: CustomTextStyles.style16Medium.copyWith(
                  color: Constant.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: SearchTextFiled(
                errorColor: Colors.red,
                fillColor: Constant.circleAvatar,
                hintTextColor: Constant.searchHintTextColor,
                controller: searchController,
                hintText: 'Search..',
                onTap: () {
                  if (bloc.formKey.currentState!.validate()) {
                    CommonFunctions().navWithReplacement(
                      context: context,
                      pageName: AvailableJobView(
                          companyName: searchController.text.trim()),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  Assets.joinUs,
                  width: 130,
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
