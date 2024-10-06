import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hire_me/constant.dart';
import 'package:hire_me/features/sign_in/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/presentation/views/search_view.dart';
import '../database/cache_helper.dart';
import '../database/shared_preferences_keys.dart';
import '../services/services_locator.dart';

class CommonFunctions {
  void navWithReplacement({
    required BuildContext context,
    required Widget pageName,
  }) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => pageName,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;
          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  void navWithoutReplacement({
    required BuildContext context,
    required Widget pageName,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => pageName,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;
          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  Future<void> saveData({required String data, required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, data);
  }

  Future<String?> getData({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  Future<void> removeData({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  Future<bool?> showToastMessage(
      {required String msg,
      required context,
      double fontSize = 12,
      Color? color}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? Constant.iconColor,
      textColor: Colors.white,
      fontSize: fontSize,
    );
  }

  void navAfterLoginSuccess({required BuildContext context}) async {
    await getIt<CacheHelper>()
        .saveData(key: getIt.get<SharedPreferencesKeys>().isLogin, value: true)
        .then(
      (value) {
        if (context.mounted) {
          CommonFunctions().navWithReplacement(
            context: context,
            pageName: const SearchView(),
          );
        }
      },
    );
  }

  Future<void> saveUserModel(
      {required String key, required UserModel model}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('${key}_name', model.name ?? '');
    await sharedPreferences.setString(
        '${key}_imagePath', model.imagePath ?? '');
  }

  Future<UserModel?> getUserModel({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? name = sharedPreferences.getString('${key}_name');
    String? imagePath = sharedPreferences.getString('${key}_imagePath');
    if (name != null) {
      log('name : $name');
      log('image : $imagePath');
      return UserModel(name: name, imagePath: imagePath);
    }

    return null;
  }

  Future<UserCredential> saveUserDataFromCred(OAuthCredential cred) async {
    final userCredential =
        await getIt<FirebaseAuth>().signInWithCredential(cred);
    final user = userCredential.user;
    if (user != null) {
      final userModel = UserModel(
        name: user.displayName,
        imagePath: user.photoURL,
      );
      await saveUserModel(
        key: getIt<SharedPreferencesKeys>().userModel,
        model: userModel,
      );
      await getUserModel(key: getIt<SharedPreferencesKeys>().userModel);
    }
    return userCredential;
  }
}
