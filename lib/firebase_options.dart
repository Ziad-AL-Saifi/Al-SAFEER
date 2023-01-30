// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA3iukcVxzaOPhvBq7uB4THE75kxcHjbZo',
    appId: '1:298985133873:web:c5685109e5d917a93fc210',
    messagingSenderId: '298985133873',
    projectId: 'alsafeer-7e10a',
    authDomain: 'alsafeer-7e10a.firebaseapp.com',
    storageBucket: 'alsafeer-7e10a.appspot.com',
    measurementId: 'G-FGDNPQ4LVR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7YQSYXx2ZYcISTo0IaZK0dQBN2yFr5OQ',
    appId: '1:298985133873:android:e182eac71a29d5ca3fc210',
    messagingSenderId: '298985133873',
    projectId: 'alsafeer-7e10a',
    storageBucket: 'alsafeer-7e10a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjGG9P0Hw4XH94t029nzShEply3Es36gc',
    appId: '1:298985133873:ios:06fefe21fb1576103fc210',
    messagingSenderId: '298985133873',
    projectId: 'alsafeer-7e10a',
    storageBucket: 'alsafeer-7e10a.appspot.com',
    iosClientId: '298985133873-a37pfuj80ka39qpfoen3ukoj3q7bl9jr.apps.googleusercontent.com',
    iosBundleId: 'com.example.alsafier',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjGG9P0Hw4XH94t029nzShEply3Es36gc',
    appId: '1:298985133873:ios:06fefe21fb1576103fc210',
    messagingSenderId: '298985133873',
    projectId: 'alsafeer-7e10a',
    storageBucket: 'alsafeer-7e10a.appspot.com',
    iosClientId: '298985133873-a37pfuj80ka39qpfoen3ukoj3q7bl9jr.apps.googleusercontent.com',
    iosBundleId: 'com.example.alsafier',
  );
}
