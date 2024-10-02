import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/services_locator.dart';
import 'sign_in_with_email_and_pass_state.dart';

class SignInWithEmailAndPassCubit extends Cubit<SignInWithEmailAndPassState> {
  SignInWithEmailAndPassCubit() : super(SignInWithEmailAndPassInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future<void> signIn() async {
    try {
      emit(SignInWithEmailAndPassLoading());
      final String email = emailController.text;
      final String password = passController.text;
      await getIt<FirebaseAuth>().signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInWithEmailAndPassSuccess());
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? 'An unknown error occurred';
      emit(
        SignInWithEmailAndFailure(errorMessage: errorMessage),
      );
    }
  }
}
