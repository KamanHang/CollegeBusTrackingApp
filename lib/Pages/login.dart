import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iicbus/Pages/dashboard.dart';
import 'package:iicbus/Pages/signup.dart';
import 'package:iicbus/bottomNavbar.dart';
import 'package:page_transition/page_transition.dart';
import '../Routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Services/LoginAuth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    var onPressed = false;
  Future loading() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void loadingScreen() async{
    setState(() {
    onPressed = true;
    }); 
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      onPressed = false;
    });
    
  }

  void dialog(response) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'))
          ],
          content: Text(
            '$response',
            style: const TextStyle(color: Colors.redAccent),
          ),
        );
      },
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool hide = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return onPressed ?
    Container(
      color: Colors.white,
      child:  const Center(
        
        child: CircularProgressIndicator()
      ),
    ):
    
    Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Log in Screen'),
      //   centerTitle: true,
      // ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),

              Image.asset(
                'assets/images/college-logo.png',
                scale: 5,
              ),
              const SizedBox(
                height: 25,
              ),

              const Text(
                'Log in',
                style: TextStyle(
                    color: Colors.blue, fontFamily: 'Poppins', fontSize: 35),
              ),

              // const SizedBox(height: 20,),

              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/waiting.png'),
                radius: 100.0,
              ),

              const SizedBox(
                height: 30,
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      // validator: (value) {
                      //   if(value == null || value.isEmpty){
                      //     return 'Please enter your college mail';
                      //   }
                      // },
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your College Email',

                        // prefixIcon: Icon(
                        //   Icons.email,
                        //   color: Colors.blue,

                        // ),
                        prefixIcon: Container(
                          // color: Colors.black,
                          width: 70,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(
                                FontAwesomeIcons.userAstronaut,
                                color: Colors.blue,
                              ),
                              const Divider(
                                color: Colors.black,
                                height: 10,
                                thickness: 2,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '|',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey.shade300),
                              ),
                            ],
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: hide ? true : false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your Password',
                        suffixIcon: InkWell(
                            onTap: () => setState(() {
                                  hide = !hide;
                                  // Icon(Icons.remove_red_eye, color: Colors.black);
                                }),
                            child: Icon(  
                              Icons.remove_red_eye,
                              color: Colors.blue.shade300,
                            )),

                        // prefixIcon: Icon(
                        //   Icons.email,
                        //   color: Colors.blue,

                        // ),
                        prefixIcon: Container(
                          // color: Colors.black,
                          width: 70,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(
                                FontAwesomeIcons.fingerprint,
                                color: Colors.blue,
                              ),
                              const Divider(
                                color: Colors.black,
                                height: 10,
                                thickness: 2,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '|',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey.shade300),
                              ),
                            ],
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.blue),
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ))),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {

                        print("Validated");
                      } else {
                        print("Not Valitaded");
                      }

                      

                      String? response = await LoginStudent.login(
                          email: _emailController.text,
                          password: _passwordController.text,);
                      
                  
                      if (response == "User doesn't exist") {
                        loadingScreen();
                        await Future.delayed(const Duration(seconds: 2));
              
                        dialog(response);
                      } else if (response == "An error occured") {
                        loadingScreen();
                        await Future.delayed(const Duration(seconds: 2));
                       
                        dialog(response);
                      } else if (response == "Log in Successful") {
                        onPressed = true;
                        // await Future.delayed(Duration(seconds: 3));
                        Navigator.pushReplacementNamed(context, Routes.dashBoard);
 
                        dialog(response);
                        onPressed = false;
                      }
                      else{
                        loadingScreen();
                        await Future.delayed(const Duration(seconds: 2));
                        dialog(response);
                      }
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, Routes.signUpScreen);
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const SignupScreen(),
                              type: PageTransitionType.fade));
                    },
                    child: const Text('Sign Up')),
              ])
            ],
          ),
        ),
      ),
    );
  }
  
}
