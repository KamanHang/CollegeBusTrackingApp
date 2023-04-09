import 'package:flutter/material.dart';
import '../Routes/routes.dart';
import 'package:page_transition/page_transition.dart';
import 'package:iconsax/iconsax.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/college-logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Edit Profile',
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
                const SizedBox(
                  height: 30,
                ),

                //Email Text Form Field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
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
                  onPressed: null,
                  child: const Text(
                    'Save',
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
          ],
        ),
      ),
    );
  }
}
