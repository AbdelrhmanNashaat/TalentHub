import 'package:flutter/material.dart';
import 'package:hire_me/features/home/data/model/company_info.dart';
import '../../../../constant.dart';
import 'widgets/company_view_body.dart';

class CompanyView extends StatelessWidget {
  final CompanyInfo companyInfo;
  const CompanyView({super.key, required this.companyInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldColor,
      body: SafeArea(
        child: CompanyViewBody(
          companyInfo: companyInfo,
        ),
      ),
    );
  }
}
