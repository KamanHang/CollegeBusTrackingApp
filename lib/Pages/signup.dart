import 'package:flutter/material.dart';
import 'package:iicbus/Pages/dashboard.dart';
import '../Routes/routes.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'login.dart';
import '../Services/SignUpAuth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void clearText() {
    _userNameController.clear();
    _emailController.clear();
    _addressController.clear();
    _passwordController.clear();
  }

  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Log in Screen'),
      //   centerTitle: true,
      // ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/images/college-logo.png',
              scale: 5,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.blue, fontFamily: 'Poppins', fontSize: 35),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                //Username Text Form Field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your username',

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
                              Icons.person,
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
                SizedBox(
                  height: 30,
                ),

                //Email Text Form Field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
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
                              Icons.email,
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

                SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your address',

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
                              Icons.home,
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

                SizedBox(
                  height: 30,
                ),

                //Password Text Form field

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
                              Iconsax.key,
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

                SizedBox(
                  height: 30,
                ),

                //Confirm Password Text Form field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    obscureText: hide ? true : false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Confirm your Password',
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
                              Iconsax.key,
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
                    String? response = await RegisterService.signUp(
                        username: _userNameController.text,
                        email: _emailController.text,
                        address: _addressController.text,
                        password: _passwordController.text);

                    if (response == "Please fill all the fields") {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              '${response}',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          );
                        },
                      );
                    } else if (response == "User alredy exists") {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              '${response}',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          );
                        },
                      );
                    } else if (response ==
                        "Student Registration Successfully") {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginScreen);

                      clearText();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              '${response}',
                              style: TextStyle(color: Colors.green),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginScreen);
                    Navigator.push(
                        context,
                        PageTransition(
                            child: LoginScreen(),
                            type: PageTransitionType.fade));
                  },
                  child: const Text('Log in')),
            ])
          ],
        ),
      ),
    );
  }
}
