import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo.dart';
import 'search_for_company_state.dart';

class SearchForCompanyCubit extends Cubit<SearchForCompanyState> {
  final HomeRepo homeRepo;
  SearchForCompanyCubit({required this.homeRepo})
      : super(SearchForCompanyInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController companyController = TextEditingController();
  Future<void> searchCompany() async {
    emit(SearchCompanyLoading());
    var data = await homeRepo.searchForCompanyDetails(
        companyName: companyController.text);
    data.fold(
      (failure) =>
          emit(SearchCompanyFailure(errorMessage: failure.errorMessage)),
      (companyInfo) => emit(SearchCompanySuccess(companyInfo: companyInfo)),
    );
  }
}
