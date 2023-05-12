import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iicbus/Pages/editprofile.dart';
import 'package:iicbus/Pages/login.dart';
import 'package:iicbus/Pages/splashScreen.dart';
import 'package:iicbus/Routes/routes.dart';
import 'package:iicbus/Services/fetchUserLocation.dart';
import 'package:iicbus/Services/user_model.dart';
import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> refresh(){
    getUserData();
    setState(() {
      getUserData(); 
    
    });
    return Future.delayed(Duration(seconds: 3)); 
    
  }

  void navigateLogin(){
     Navigator.pushReplacementNamed(
     context, Routes.loginScreen);
  }
  List<UserDetails> userDetails = [];
  var onPressed = false;

  Future loading() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void loadingScreen() async {
    setState(() {
      onPressed = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      onPressed = false;
    });
  }

  String emailValue = "";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  Future<String?> getUserDetails() async {

    String? response = await lol.user(
      email: emailValue);

      String student = jsonEncode(response);
      print(student);

    return response;
  }
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return onPressed
        ? Container(
            child: const Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Image.asset(
                'assets/images/college-logo.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              centerTitle: true,
            ),
            body: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return RefreshIndicator(
                    onRefresh:(){
                    setState(() {
                    });
                    return getUserData();
                    },
                    child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        // color: Colors.greenAccent,
                        child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/avatar.png'),
                            backgroundColor: Colors.white,
                            radius: 100,
                          )
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              padding: EdgeInsets.fromLTRB(20, 30, 10, 30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(2, 2), // Shadow position
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      Text(
                                        'Username:',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'College Email:',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        'Address:',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${userDetails[index].username}',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        emailValue,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        '${userDetails[index].address}',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.blue)),
                                onPressed: () {
                                  // Navigator.pushNamed(context, Routes.dashBoard);
                                  
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const EditProfile(),
                                          type: PageTransitionType.fade));
                                },
                                child: const Text(
                                  'Edit Profile',
                                  style: TextStyle(color: Colors.white),
                                )),
                            ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.blue)),
                                onPressed: () async {
                                  var sharedPref =
                                      await SharedPreferences.getInstance();
                                  sharedPref.setBool(SplashScreenState.KEYLOGIN, false);
                                  
                                  loadingScreen();
                                  await Future.delayed(const Duration(seconds: 1));
                  
                                  navigateLogin();
                  
                  
                                 
                                },
                                child: Text(
                                  'Sign out',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      ],
                    ),
                      );
                    },
                    
                                  ),
                  );
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }
              }
            )
            
          );   
  }
  void getValue() async {
    var sharedEmail = await SharedPreferences.getInstance();
    var getName = sharedEmail.getString(LoginScreenState.KEYEMAIL);

    setState(() {
      emailValue = getName!;
    });
  }

  Future<List<UserDetails>> getUserData() async {
    var url = Uri.parse('http://192.168.127.198:5000/fetchStudentdetails');

      var response = await http.post(url, body: {'email': emailValue}).timeout(
              const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('Check Internet Connection');
      });
      print(response);
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for(Map<String, dynamic> index in data){
          userDetails.add(UserDetails.fromJson(index));
        }
        print(userDetails);
        return userDetails;
      }

      return userDetails;
        
    }
}

  

  
