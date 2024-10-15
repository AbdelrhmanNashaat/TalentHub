import '../../../data/model/company_jobs.dart';

class CompanyJobState {}

class CompanyJobInitial extends CompanyJobState {}

class CompanyJobSuccess extends CompanyJobState {
  final CompanyJobs companyJobs;

  CompanyJobSuccess({required this.companyJobs});
}

class CompanyJobFailure extends CompanyJobState {
  final String errorMessage;

  CompanyJobFailure({required this.errorMessage});
}

class CompanyJobLoading extends CompanyJobState {}
