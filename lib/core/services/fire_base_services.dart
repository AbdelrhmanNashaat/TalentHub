import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hire_me/core/common/functions.dart';

class FireBaseServices {
  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }
      final googleAuth = await googleUser.authentication;
      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      final googleProfile = googleUser.photoUrl;
      UserCredential userCredential = await CommonFunctions()
          .saveUserDataFromCred(cred: cred, image: googleProfile);
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
        final userData = await FacebookAuth.instance
            .getUserData(fields: "name,email,picture.width(200)");
        final String? profileImageUrl = userData["picture"]["data"]["url"];
        UserCredential userCredential = await CommonFunctions()
            .saveUserDataFromCred(
                cred: facebookAuthCredential, image: profileImageUrl);
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
