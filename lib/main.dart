import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:estore2/Registrations/log in.dart';
import 'package:estore2/Registrations/sign_up.dart';
import 'package:estore2/Screens/homescreen.dart';
import 'package:estore2/Registrations/password page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Login.id,
      routes: {
        Login.id: (context) => Login(),
        SignupPage.id: (context) => SignupPage(),
        HomeScreen.id: (context) => HomeScreen(),
        PasswordPage.id:(context) => PasswordPage(),
      },
    );
  }
}