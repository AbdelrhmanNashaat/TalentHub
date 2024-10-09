import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_me/features/home/data/model/job_search_response_model.dart';
import 'package:hire_me/features/home/data/repo/home_repo.dart';

import 'search_job_state.dart';

class SearchJobCubit extends Cubit<SearchJobState> {
  final HomeRepo homeRepo;
  SearchJobCubit({required this.homeRepo}) : super(SearchJobInitial());
  final TextEditingController searchController = TextEditingController();
  late JobSearchResponse jobList;
  Future<void> searchJob() async {
    emit(SearchJobLoading());
    var data =
        await homeRepo.searchForAJob(query: searchController.text.trim());
    data.fold(
        (failure) => emit(SearchJobFailure(errorMessage: failure.errorMessage)),
        (jobList) {
      this.jobList = jobList;
      emit(SearchJobSuccess());
    });
  }
}
