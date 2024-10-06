import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hire_me/core/common/functions.dart';

class FireBaseServices {
  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      log('Google sign in: ${googleUser?.id}');
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      UserCredential userCredential =
          await CommonFunctions().saveUserDataFromCred(cred);
      return userCredential;
    } catch (ex) {
      log('Login with Google exception: ${ex.toString()}');
    }
    return null;
  }

  Future<UserCredential?> loginWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
                loginResult.accessToken!.tokenString);
        UserCredential userCredential = await CommonFunctions()
            .saveUserDataFromCred(facebookAuthCredential);
        return userCredential;
      } else {
        log('Failed to retrieve access token');
      }
    } catch (ex) {
      log('Login with Facebook exception: ${ex.toString()}');
    }
    return null;
  }
}
