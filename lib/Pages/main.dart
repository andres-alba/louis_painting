import 'package:flutter/material.dart';
//import 'HomePage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:louis_painting/Pages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Loui's Painting",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new WelcomePage(),
    );
  }
}
