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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAcHe-zTnv-maDKwkG8jyZZD8AhJbRcdOo',
    appId: '1:896787399099:web:82e4635a5ffd7bf977c49e',
    messagingSenderId: '896787399099',
    projectId: 'evently-app-7a504',
    authDomain: 'evently-app-7a504.firebaseapp.com',
    storageBucket: 'evently-app-7a504.firebasestorage.app',
    measurementId: 'G-JB9FTK7RDZ',
  );

  static  FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmkQhCk-NvCzRamhk27FJ8Pyl9YdjjOYQ',
    appId: '1:896787399099:android:cbf4c3e8fecdf2cb77c49e',
    messagingSenderId: '896787399099',
    projectId: 'evently-app-7a504',
    storageBucket: 'evently-app-7a504.firebasestorage.app',
  );

  static  FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA45RGI4u1NIIj_yC3mIHQv70AR5rZK-t0',
    appId: '1:896787399099:ios:340defa0538a485f77c49e',
    messagingSenderId: '896787399099',
    projectId: 'evently-app-7a504',
    storageBucket: 'evently-app-7a504.firebasestorage.app',
    iosBundleId: 'com.example.eventlyApp',
  );
}
