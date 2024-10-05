import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/fire_base_services.dart';
import '../../../../../core/services/services_locator.dart';
import 'sign_in_with_facebook_state.dart';

class SignInWithFacebookCubit extends Cubit<SignInWithFacebookState> {
  SignInWithFacebookCubit() : super(SignInWithFacebookInitial());
  Future<void> signInWithFacebook() async {
    emit(SignInWithFacebookLoading());
    UserCredential? userCredential =
        await getIt.get<FireBaseServices>().loginWithFacebook();
    if (userCredential != null) {
      emit(SignInWithFacebookSuccess());
    } else {
      emit(SignInWithFacebookFailure(errorMessage: 'Error'));
    }
  }
}
