import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBS-teExgOHex8wPcDqQwfFbKSAmPOssFI',
    appId: '1:890341112803:web:11776e28210d19f5dbbed6',
    messagingSenderId: '890341112803',
    projectId: 'big-life-advice-9839a',
    authDomain: 'big-life-advice-9839a.firebaseapp.com',
    storageBucket: 'big-life-advice-9839a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3C6fZvftRyXgEvnRht4eAUlJa_jzVuMA',
    appId: '1:890341112803:android:a3729ae8acc4c615dbbed6',
    messagingSenderId: '890341112803',
    projectId: 'big-life-advice-9839a',
    storageBucket: 'big-life-advice-9839a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJxjY6UNX8a4ojSjQfDbp9pUnk21_JJuA',
    appId: '1:890341112803:ios:b183c01b09400770dbbed6',
    messagingSenderId: '890341112803',
    projectId: 'big-life-advice-9839a',
    storageBucket: 'big-life-advice-9839a.appspot.com',
    iosClientId: '890341112803-4cqfh8fg6vc15l5pnhtlpu1glphl6ls1.apps.googleusercontent.com',
    iosBundleId: 'com.crevis.bigLifeAdvice',
  );
}
