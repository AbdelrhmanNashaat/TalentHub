import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassInitial());

  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resetPassword() async {
    final email = emailController.text.trim();
    emit(ForgetPassLoading());

    try {
      await _auth.sendPasswordResetEmail(email: email);
      emit(ForgetPassSuccess());
    } catch (error) {
      emit(
        ForgetPassFailure(
            errorMessage: 'Failed to send reset email. Please try again.'),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
