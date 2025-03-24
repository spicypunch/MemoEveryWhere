import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static FirebaseOptions get webOptions => const FirebaseOptions(
    apiKey: "",
    authDomain: "",
    databaseURL: "",
    projectId: "",
    storageBucket: "",
    messagingSenderId: "",
    appId: "",
  );
}
