// import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iicbus/Pages/login.dart';
import 'package:iicbus/bottomNavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }
  

  static const String KEYLOGIN = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          scale: 5,
        ),
      ),
    );
  }
  
  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedin = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {

      if(isLoggedin != null){
        if(isLoggedin){
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Navbar()));
        }
        else{
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      }else{

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));

      }

     });

    
  }
}
