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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCMpBgT5GfczicyTdgC9YwKNcvKNRJHFjk',
    appId: '1:1039154083751:web:3a1da742ded54543476882',
    messagingSenderId: '1039154083751',
    projectId: 'cemp-hub',
    authDomain: 'cemp-hub.firebaseapp.com',
    databaseURL: 'https://cemp-hub-default-rtdb.firebaseio.com',
    storageBucket: 'cemp-hub.appspot.com',
    measurementId: 'G-GJQR0YSHD3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGzDXpCRuSJXbVj-TEhquptvu--8-G0gk',
    appId: '1:1039154083751:android:6fd4ee00f8304ab6476882',
    messagingSenderId: '1039154083751',
    projectId: 'cemp-hub',
    databaseURL: 'https://cemp-hub-default-rtdb.firebaseio.com',
    storageBucket: 'cemp-hub.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1xnoCqNFLtLymCYbAf1HbfsjPKsd3mXs',
    appId: '1:1039154083751:ios:6f5d88273f2dff22476882',
    messagingSenderId: '1039154083751',
    projectId: 'cemp-hub',
    databaseURL: 'https://cemp-hub-default-rtdb.firebaseio.com',
    storageBucket: 'cemp-hub.appspot.com',
    iosClientId: '1039154083751-6vndotoqjhhqgonduec1mhktugimv725.apps.googleusercontent.com',
    iosBundleId: 'com.example.cempHub',
  );
}
