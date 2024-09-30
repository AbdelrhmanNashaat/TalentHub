// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDJwc4DtwQJUL2DznqhFoLEX7iluliEENI',
    appId: '1:249093260623:web:63c58bccc8778ec61af13a',
    messagingSenderId: '249093260623',
    projectId: 'hireme-7135f',
    authDomain: 'hireme-7135f.firebaseapp.com',
    storageBucket: 'hireme-7135f.appspot.com',
    measurementId: 'G-52H7E91634',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1lWklZ0wm9GP8-mYoYfaDOzJEduFFwYQ',
    appId: '1:249093260623:android:3903f8ecae2f6f3a1af13a',
    messagingSenderId: '249093260623',
    projectId: 'hireme-7135f',
    storageBucket: 'hireme-7135f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3fzNhboaDY7ucskYUoCoEj7frbBGPa3Y',
    appId: '1:249093260623:ios:5c9963d0719c7d2d1af13a',
    messagingSenderId: '249093260623',
    projectId: 'hireme-7135f',
    storageBucket: 'hireme-7135f.appspot.com',
    iosBundleId: 'com.example.hireMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3fzNhboaDY7ucskYUoCoEj7frbBGPa3Y',
    appId: '1:249093260623:ios:5c9963d0719c7d2d1af13a',
    messagingSenderId: '249093260623',
    projectId: 'hireme-7135f',
    storageBucket: 'hireme-7135f.appspot.com',
    iosBundleId: 'com.example.hireMe',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDJwc4DtwQJUL2DznqhFoLEX7iluliEENI',
    appId: '1:249093260623:web:8b49b30b9589b3941af13a',
    messagingSenderId: '249093260623',
    projectId: 'hireme-7135f',
    authDomain: 'hireme-7135f.firebaseapp.com',
    storageBucket: 'hireme-7135f.appspot.com',
    measurementId: 'G-JYTNMM3XF3',
  );
}
