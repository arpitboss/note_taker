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
    apiKey: 'AIzaSyBSG0mopEpVR6Mu38V9oVTZJ72-WwoDr-c',
    appId: '1:988295067455:web:c33c21fb76af083a6e858a',
    messagingSenderId: '988295067455',
    projectId: 'notetaker-c8c17',
    authDomain: 'notetaker-c8c17.firebaseapp.com',
    storageBucket: 'notetaker-c8c17.appspot.com',
    measurementId: 'G-J1QGYBBGQB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgyE64rQ0wI1hxwJN3LRpTy1Ivj16Yv08',
    appId: '1:988295067455:android:69be273cc1c61a266e858a',
    messagingSenderId: '988295067455',
    projectId: 'notetaker-c8c17',
    storageBucket: 'notetaker-c8c17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBa3sbmqBG4w1oS0d8h-jZyd1Z63kAbf0A',
    appId: '1:988295067455:ios:da92bf78c295d0276e858a',
    messagingSenderId: '988295067455',
    projectId: 'notetaker-c8c17',
    storageBucket: 'notetaker-c8c17.appspot.com',
    iosBundleId: 'com.example.noteTaker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBa3sbmqBG4w1oS0d8h-jZyd1Z63kAbf0A',
    appId: '1:988295067455:ios:5e6da32cb03519666e858a',
    messagingSenderId: '988295067455',
    projectId: 'notetaker-c8c17',
    storageBucket: 'notetaker-c8c17.appspot.com',
    iosBundleId: 'com.example.noteTaker.RunnerTests',
  );
}
