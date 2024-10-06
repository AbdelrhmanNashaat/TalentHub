import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hire_me/core/common/functions.dart';
import 'package:hire_me/core/database/shared_preferences_keys.dart';
import 'package:hire_me/features/sign_in/data/model/user_model.dart';
import '../../../../../core/services/services_locator.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> signUp() async {
    try {
      CommonFunctions().saveUserModel(
        key: getIt.get<SharedPreferencesKeys>().userModel,
        model: UserModel(name: nameController.text, imagePath: null),
      );
      emit(SignUpLoading());
      UserCredential userCredential = await getIt<FirebaseAuth>()
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        emit(SignUpSuccess('Account created. Please verify your email.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(errorMessage: 'Email already in use.'));
      } else if (e.code == 'weak-password') {
        emit(SignUpFailure(errorMessage: 'The password is too weak.'));
      } else if (e.code == 'invalid-email') {
        emit(SignUpFailure(errorMessage: 'The email is invalid.'));
      } else {
        emit(SignUpFailure(errorMessage: 'Sign-up failed. ${e.message}'));
      }
    } catch (e) {
      emit(SignUpFailure(
          errorMessage: 'An error occurred. Please try again later.'));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
