import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iicbus/Pages/editprofile.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/profile.png',
              scale: 4.0,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      children: const [
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
                      children: const [
                        Text(
                          'Kaman',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'np05cp4s220028@iic.edu.np',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Dharan',
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
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  onPressed: () {
                    // Navigator.pushNamed(context, Routes.dashBoard);

                    Navigator.push(
                        context,
                        PageTransition(
                            child: const EditProfile(),
                            type: PageTransitionType.fade));
                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
