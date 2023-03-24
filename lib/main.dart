import 'package:flutter/material.dart';
import 'package:iicbus/Pages/dashboard.dart';
import 'package:iicbus/Pages/login.dart';
import 'package:iicbus/Pages/signup.dart';
import 'Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.loginScreen:((context) => LoginScreen()),
        Routes.signUpScreen:((context) => SignUp()),
        Routes.dashBoard:((context) => DashBoard())
      },
    );
  }
}