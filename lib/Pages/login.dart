import 'package:flutter/material.dart';
import '../Routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Log in Screen'),
      //   centerTitle: true,
      // ),

      body:SingleChildScrollView(
        child: Column(
          children: [
      
            const SizedBox(height: 80,),
      
            Image.asset(
                  'assets/images/college-logo.png',
                  scale: 5,
                ),
      
            const SizedBox(height: 25,),
      
            const Text(
              'Log in',
              style: TextStyle(
                color: Colors.blue,
                fontFamily: 'Poppins',
                fontSize: 35
              ),
            ),
      
            // const SizedBox(height: 20,),
      
            const SizedBox(height: 20,),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/waiting.png'),
                  radius: 100.0,
            ),
      
            const SizedBox(height: 30,),
      
            Column(
              children: [
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
                        
                                  Text('|',
                                  style: TextStyle(
                                    fontSize:23,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey.shade300
                                  ),
                                  ),

                            ],
                          ),
                        ),
                
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                    )
                    ),
                  
                    enabledBorder: OutlineInputBorder(
                                            
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                        )
                                        
                    ),
                  
                  ),
                  ),
                ),

                SizedBox(height: 30,),

                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    obscureText:  hide? true : false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your Password',
                      suffixIcon: InkWell
                      (
                        onTap: () =>
                        setState(() {
                           hide = !hide;
                            // Icon(Icons.remove_red_eye, color: Colors.black);
                        })
                        ,
                        child: Icon(Icons.remove_red_eye, color: Colors.blue.shade300,)),

                
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
                        
                                  Text('|',
                                  style: TextStyle(
                                    fontSize:23,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey.shade300
                                  ),
                                  ),

                            ],
                          ),
                        ),
                
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                    )
                    ),
                  
                    enabledBorder: OutlineInputBorder(
                                            
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                        )
                                        
                    ),
                  
                  ),
                  ),
                ),
                const SizedBox(height: 30,),

                 ElevatedButton(
                  
                  style: ButtonStyle(
                    backgroundColor:const MaterialStatePropertyAll(Colors.blue),
                    padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),))
                    
                  ),
                  
                  
                  onPressed: (){
      
                    Navigator.pushNamed(context, Routes.dashBoard);
                  },
                
                 child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                 ),
                 )
                
                
              ],
            ),
      
            
      
      
      
            const SizedBox(height: 20,),

      
      
      
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children:[

                  const Text(
                    "Don't have an account?"
                  ),

                   TextButton(
                    onPressed:(){
                      Navigator.pushNamed(context, Routes.signUpScreen);
                    }, child: const Text('Sign Up')),

                ]
              
            )
          ],
        ),
      ) ,

    );
  }
}