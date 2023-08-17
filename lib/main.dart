import 'package:estore2/Registrations/log in.dart';
import 'package:flutter/material.dart';
import 'package:estore2/Registrations/sign_up.dart';
import 'package:estore2/Screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: login.id, routes: {
      login.id: (context) => login(),
      SignupPage.id: (context) => SignupPage(),
      HomeScreen.id: (context) => HomeScreen(),
    });
  }
}
