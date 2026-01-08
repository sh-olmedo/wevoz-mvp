import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB5bTcwaQBPWvQJ1hlSTjyJ8kXQOqOZY2E",
            authDomain: "wevoz-5a0ec.firebaseapp.com",
            projectId: "wevoz-5a0ec",
            storageBucket: "wevoz-5a0ec.appspot.com",
            messagingSenderId: "72260453716",
            appId: "1:72260453716:web:24112e89d3f97c8ae2b4c1"));
  } else {
    await Firebase.initializeApp();
  }
}
