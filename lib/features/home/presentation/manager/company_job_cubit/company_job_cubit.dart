import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/features/home/data/repo/home_repo.dart';

import 'company_job_state.dart';

class CompanyJobCubit extends Cubit<CompanyJobState> {
  final HomeRepo homeRepo;
  CompanyJobCubit({required this.homeRepo}) : super(CompanyJobInitial());
  Future<void> getCompanyJobs({required String companyName}) async {
    log('CompanyJobCubit: $companyName');
    emit(CompanyJobLoading());
    final response =
        await homeRepo.searchForCompanyJobs(companyName: companyName);
    response.fold(
      (failure) => emit(CompanyJobFailure(errorMessage: failure.errorMessage)),
      (jobs) => emit(CompanyJobSuccess(companyJobs: jobs)),
    );
  }
}
