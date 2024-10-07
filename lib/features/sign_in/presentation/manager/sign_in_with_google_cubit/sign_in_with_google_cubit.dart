import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/fire_base_services.dart';
import '../../../../../core/services/services_locator.dart';
import 'sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit() : super(SignInWithGoogleInitial());
  Future<void> signInWithGoogle() async {
    emit(SignInWithGoogleLoading());
    UserCredential? userCredential =
        await getIt.get<FireBaseServices>().loginWithGoogle();
    if (userCredential != null) {
      emit(SignInWithGoogleSuccess());
    } else {
      emit(SignInWithGoogleFailure());
    }
  }
}
