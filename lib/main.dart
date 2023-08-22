import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:estore2/Registrations/log in.dart';
import 'package:estore2/Registrations/sign_up.dart';
import 'package:estore2/Screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: login.id,
      routes: {
        login.id: (context) => login(),
        SignupPage.id: (context) => SignupPage(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}