abstract class ForgetPassState {}

class ForgetPassInitial extends ForgetPassState {}

class ForgetPassSuccess extends ForgetPassState {}

class ForgetPassLoading extends ForgetPassState {}

class ForgetPassFailure extends ForgetPassState {
  final String errorMessage;

  ForgetPassFailure({required this.errorMessage});
}
