import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/core/utils/assets.dart';
import 'package:hire_me/features/home/presentation/manager/cubit/search_for_company_state.dart';
import 'package:hire_me/features/home/presentation/views/company_view.dart';
import '../../../../../core/common/functions.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../manager/cubit/search_for_company_cubit.dart';
import 'app_bar.dart';
import 'search_bar.dart';

class ExploreCompanyViewBody extends StatelessWidget {
  const ExploreCompanyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var searchForCompanyCubit = BlocProvider.of<SearchForCompanyCubit>(context);
    return Form(
      key: searchForCompanyCubit.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 12),
            const CustomAppBar(title: 'Explore Companies'),
            const Spacer(),
            Text(
              'Thoroughly research the companies you\nare interested in, including all relevant\ndetails about them.',
              style: CustomTextStyles.style16Medium.copyWith(
                color: Constant.iconColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              Assets.searchCompany,
              width: 300,
            ),
            BlocConsumer<SearchForCompanyCubit, SearchForCompanyState>(
              listener: (context, state) {
                if (state is SearchCompanySuccess) {
                  searchForCompanyCubit.companyController.clear();
                  CommonFunctions().navWithReplacement(
                    context: context,
                    pageName: CompanyView(
                      companyInfo: state.companyInfo,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return SearchTextFiled(
                  isLoading: state is SearchCompanyLoading ? true : false,
                  errorColor: Colors.red,
                  controller: searchForCompanyCubit.companyController,
                  hintText: 'Search for a company (eg. Google)',
                  fillColor: Constant.circleAvatar,
                  hintTextColor: Constant.iconColor,
                  containerColor: Constant.iconColor,
                  onTap: () {
                    if (searchForCompanyCubit.formKey.currentState!
                        .validate()) {
                      searchForCompanyCubit.searchCompany();
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 25),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
