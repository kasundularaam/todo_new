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
    apiKey: 'AIzaSyCJioM3y2uKGqGqB6mEJoSK3zNQo2QPc8I',
    appId: '1:607941959635:web:38655abe4bf86045ab5926',
    messagingSenderId: '607941959635',
    projectId: 'todo-ddd-new',
    authDomain: 'todo-ddd-new.firebaseapp.com',
    storageBucket: 'todo-ddd-new.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZ4jHuEDgJCUinKdrQxiN7t54MAgas20s',
    appId: '1:607941959635:android:a3e2fe139fa72c7aab5926',
    messagingSenderId: '607941959635',
    projectId: 'todo-ddd-new',
    storageBucket: 'todo-ddd-new.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACHsKo2v7jTrTD1ZG_okbcfyfwADss6zo',
    appId: '1:607941959635:ios:fc9aeeb6efc5b1acab5926',
    messagingSenderId: '607941959635',
    projectId: 'todo-ddd-new',
    storageBucket: 'todo-ddd-new.appspot.com',
    iosClientId: '607941959635-17hmnf31a219rhb71lbe6u4vm1sf65cf.apps.googleusercontent.com',
    iosBundleId: 'com.miraclehouse.todoNew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACHsKo2v7jTrTD1ZG_okbcfyfwADss6zo',
    appId: '1:607941959635:ios:fc9aeeb6efc5b1acab5926',
    messagingSenderId: '607941959635',
    projectId: 'todo-ddd-new',
    storageBucket: 'todo-ddd-new.appspot.com',
    iosClientId: '607941959635-17hmnf31a219rhb71lbe6u4vm1sf65cf.apps.googleusercontent.com',
    iosBundleId: 'com.miraclehouse.todoNew',
  );
}