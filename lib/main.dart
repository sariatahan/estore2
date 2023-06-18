import 'package:estore2/log%20in.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: login.id, routes: {
    login.id:(context)=>login(),

    });
  }
}
