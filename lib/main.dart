import 'package:covpass/pages/Login.dart';
import 'package:covpass/pages/SignUp.dart';
import 'package:covpass/pages/Welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CovPass',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        SignUpPage.id: (context) => SignUpPage(),
        LoginPage.id: (context) => LoginPage(),
      },
    );
  }
}
