import '../../../data/model/company_info.dart';

class SearchForCompanyState {}

final class SearchForCompanyInitial extends SearchForCompanyState {}

class SearchCompanySuccess extends SearchForCompanyState {
  final CompanyInfo companyInfo;

  SearchCompanySuccess({required this.companyInfo});
}

class SearchCompanyLoading extends SearchForCompanyState {}

class SearchCompanyFailure extends SearchForCompanyState {
  final String errorMessage;

  SearchCompanyFailure({required this.errorMessage});
}
