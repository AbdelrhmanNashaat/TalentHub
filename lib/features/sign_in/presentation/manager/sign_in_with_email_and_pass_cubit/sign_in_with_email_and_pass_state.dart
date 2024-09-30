abstract class SignInWithEmailAndPassState {}

class SignInWithEmailAndPassInitial extends SignInWithEmailAndPassState {}

class SignInWithEmailAndPassSuccess extends SignInWithEmailAndPassState {}

class SignInWithEmailAndFailure extends SignInWithEmailAndPassState {
  final String errorMessage;

  SignInWithEmailAndFailure({required this.errorMessage});
}

class SignInWithEmailAndPassLoading extends SignInWithEmailAndPassState {}
