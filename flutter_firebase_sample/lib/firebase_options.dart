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
    apiKey: 'AIzaSyDK-M5ZkJGIYXAz5lYZs-87ODXyekLQUcU',
    appId: '1:608259607996:web:5a7d4d430628465acd6fb9',
    messagingSenderId: '608259607996',
    projectId: 'flutterdb-d1a35',
    authDomain: 'flutterdb-d1a35.firebaseapp.com',
    storageBucket: 'flutterdb-d1a35.appspot.com',
    measurementId: 'G-MF1WVT1ZBM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuEtR4omxLNLkjaQ7X_P6SzqroU5-OVMo',
    appId: '1:608259607996:android:01325d1917fb7fafcd6fb9',
    messagingSenderId: '608259607996',
    projectId: 'flutterdb-d1a35',
    storageBucket: 'flutterdb-d1a35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5ur47tt38qpoViFTk4WFFWBpY2xpalXE',
    appId: '1:608259607996:ios:b199e661d382b7bacd6fb9',
    messagingSenderId: '608259607996',
    projectId: 'flutterdb-d1a35',
    storageBucket: 'flutterdb-d1a35.appspot.com',
    iosBundleId: 'com.example.flutterFirebaseSample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5ur47tt38qpoViFTk4WFFWBpY2xpalXE',
    appId: '1:608259607996:ios:d0afa3996c509a96cd6fb9',
    messagingSenderId: '608259607996',
    projectId: 'flutterdb-d1a35',
    storageBucket: 'flutterdb-d1a35.appspot.com',
    iosBundleId: 'com.example.flutterFirebaseSample.RunnerTests',
  );
}
