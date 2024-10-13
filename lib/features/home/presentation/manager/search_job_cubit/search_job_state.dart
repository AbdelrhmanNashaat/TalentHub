import '../../../data/model/job_search_response_model.dart';

abstract class SearchJobState {}

class SearchJobInitial extends SearchJobState {}

class SearchJobSuccess extends SearchJobState {
  final JobSearchResponse jobList;

  SearchJobSuccess({required this.jobList});
}

class SearchJobLoading extends SearchJobState {}

class SearchJobFailure extends SearchJobState {
  final String errorMessage;

  SearchJobFailure({required this.errorMessage});
}
