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
    apiKey: 'AIzaSyB_-gJp3cZCAXdyGMxNxyRAq61qoP55GWo',
    appId: '1:816975077046:web:ec8b00544078f437141017',
    messagingSenderId: '816975077046',
    projectId: 'weather-73596',
    authDomain: 'weather-73596.firebaseapp.com',
    storageBucket: 'weather-73596.firebasestorage.app',
    measurementId: 'G-2NTZ8DLF8F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBE3KO3UemPR8L2HWPcAKER2tTrw1TJ-aI',
    appId: '1:816975077046:android:344a6273d8be891b141017',
    messagingSenderId: '816975077046',
    projectId: 'weather-73596',
    storageBucket: 'weather-73596.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnSbvgX81nE4zn08bA5Bh2orD7J7aOfyw',
    appId: '1:816975077046:ios:2b68bea3d1004bc4141017',
    messagingSenderId: '816975077046',
    projectId: 'weather-73596',
    storageBucket: 'weather-73596.firebasestorage.app',
    iosBundleId: 'com.example.learn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnSbvgX81nE4zn08bA5Bh2orD7J7aOfyw',
    appId: '1:816975077046:ios:2b68bea3d1004bc4141017',
    messagingSenderId: '816975077046',
    projectId: 'weather-73596',
    storageBucket: 'weather-73596.firebasestorage.app',
    iosBundleId: 'com.example.learn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB_-gJp3cZCAXdyGMxNxyRAq61qoP55GWo',
    appId: '1:816975077046:web:062b045801001e37141017',
    messagingSenderId: '816975077046',
    projectId: 'weather-73596',
    authDomain: 'weather-73596.firebaseapp.com',
    storageBucket: 'weather-73596.firebasestorage.app',
    measurementId: 'G-HSR4HBF59C',
  );

}