import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:site_hope/app_widget.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDvAAE8m3JjOYPE7_iJQLH0aMeGonqK_9o",
      authDomain: "hope-viagens.firebaseapp.com",
      projectId: "hope-viagens",
      storageBucket: "hope-viagens.appspot.com",
      messagingSenderId: "321372217823",
      appId: "1:321372217823:web:dccf63cd41fbb05c99a46a",
      measurementId: "G-WT2L5EKM7R",
    ),
  );
  usePathUrlStrategy();
  runApp(const AppWidget());
}
