import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/features/home/data/repo/home_repo.dart';

import 'search_job_state.dart';

class SearchJobCubit extends Cubit<SearchJobState> {
  final HomeRepo homeRepo;
  SearchJobCubit({required this.homeRepo}) : super(SearchJobInitial());
  final TextEditingController searchController = TextEditingController();
  Future<void> searchJob() async {
    emit(SearchJobLoading());
    var data =
        await homeRepo.searchForAJob(query: searchController.text.trim());
    data.fold(
        (failure) => emit(SearchJobFailure(errorMessage: failure.errorMessage)),
        (jobList) => emit(SearchJobSuccess(jobList: jobList)));
  }
}
