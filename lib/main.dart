import 'package:bloc_pattern/loginpage.dart';
import 'package:flutter/material.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor list',
      theme: ThemeData(
        primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
    );
  }
}