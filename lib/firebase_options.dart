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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0-m9yfBEzhZadvRjWVB5EH7AiO0oY15g',
    appId: '1:416733557792:android:8a2a4333dfc5382fcb7845',
    messagingSenderId: '416733557792',
    projectId: 'pixelnsemicolon',
    storageBucket: 'pixelnsemicolon.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCE5vvJ8EEMdxoJGbu07BqEW5z126W3t_Q',
    appId: '1:416733557792:ios:6db5e63ba65d86a7cb7845',
    messagingSenderId: '416733557792',
    projectId: 'pixelnsemicolon',
    storageBucket: 'pixelnsemicolon.appspot.com',
    androidClientId: '416733557792-j7nlmk4mjtvf4fqb6l54npe5598qrqo2.apps.googleusercontent.com',
    iosClientId: '416733557792-du88dfkct72lb6mk4q87nnd6pfq8gse3.apps.googleusercontent.com',
    iosBundleId: 'com.example.pixelnsemicolon',
  );
}
