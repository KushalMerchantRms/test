import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCwYQBjDsnUjphhPYvRp1C5tvdxW_eLqSI",
            authDomain: "visu-backend-firebase-dev.firebaseapp.com",
            projectId: "visu-backend-firebase-dev",
            storageBucket: "visu-backend-firebase-dev.firebasestorage.app",
            messagingSenderId: "963839653458",
            appId: "1:963839653458:web:b0f1a5aefe9c9f0a6fd18b"));
  } else {
    await Firebase.initializeApp();
  }
}
