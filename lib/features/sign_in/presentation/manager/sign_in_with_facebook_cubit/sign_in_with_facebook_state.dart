abstract class SignInWithFacebookState {}

class SignInWithFacebookInitial extends SignInWithFacebookState {}

class SignInWithFacebookSuccess extends SignInWithFacebookState {}

class SignInWithFacebookLoading extends SignInWithFacebookState {}

class SignInWithFacebookFailure extends SignInWithFacebookState {
  final String errorMessage;

  SignInWithFacebookFailure({required this.errorMessage});
}
