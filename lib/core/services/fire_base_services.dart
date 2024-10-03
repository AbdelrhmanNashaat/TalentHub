import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'services_locator.dart';

class FireBaseServices {
  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      log('google sign in: ${googleUser?.id}');
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      return getIt<FirebaseAuth>().signInWithCredential(cred);
    } catch (ex) {
      log('login with google ex : ${ex.toString()}');
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
        return FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } else {
        log('Failed to retrieve access token');
      }
    } catch (ex) {
      log('login with facebook ex : ${ex.toString()}');
    }
    return null;
  }
}
