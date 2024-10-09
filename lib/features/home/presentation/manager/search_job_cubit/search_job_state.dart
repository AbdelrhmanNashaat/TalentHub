abstract class SearchJobState {}

class SearchJobInitial extends SearchJobState {}

class SearchJobSuccess extends SearchJobState {}

class SearchJobLoading extends SearchJobState {}

class SearchJobFailure extends SearchJobState {
  final String errorMessage;

  SearchJobFailure({required this.errorMessage});
}
