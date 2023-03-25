import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.6646, 87.2718),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/college-logo.png', fit: BoxFit.contain, height: 32,),
        centerTitle: true,
      ),
      body: GoogleMap(
                initialCameraPosition: _kGooglePlex,
                mapType: MapType.normal,
                zoomControlsEnabled: false,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
          showModalBottomSheet(
            context: context, 
            builder: (BuildContext context) {
              return SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    
                    children: [
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Choose your Bus Location',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(FontAwesomeIcons.bus,
                          color: Colors.grey.shade900,
                          ),
                        ]
                        ),

                      SizedBox(height: 40,),
                      
                        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[

                             ElevatedButton(
                              style: ButtonStyle(
                              backgroundColor:const MaterialStatePropertyAll(Colors.blue),
                              padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 40)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),)),
                            
                              
                            ),
                              onPressed:null,
                               child: const Text(
                                'Dharan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                            )),

                            SizedBox(height: 20,),

                
                            ElevatedButton(
                
                              style: ButtonStyle(
                              backgroundColor:const MaterialStatePropertyAll(Colors.blue),
                              padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 40)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),))
                              
                            ),
                              onPressed:null,
                               child: const Text(
                                'Inaruwa',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                )),
                            ]
                          ),
                          SizedBox(height: 20,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[

                          
                          
                         ElevatedButton(
                
                          style: ButtonStyle(
                          backgroundColor:const MaterialStatePropertyAll(Colors.blue),
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 40)),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),)),
                        
                          
                        ),
                          onPressed:null,
                           child: const Text(
                            'Damak',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,

                            ),
                            )),

                          SizedBox(height: 20,),
                
                        ElevatedButton(
                
                          style: ButtonStyle(
                          backgroundColor:const MaterialStatePropertyAll(Colors.blue),
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 40)),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),))
                          
                        ),
                          onPressed:null,
                           child: const Text(
                            'Biratnagar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,

                            ),
                            )),
                        ]
                      ),
                        ],
                      ),

                      
                    ],
                  ),
                ),
              );
            }
            
          );
          
        }, child: FaIcon(FontAwesomeIcons.locationArrow, 
            color: Colors.blue,
          ),
        
        ),
          

          
            
        
      
          
          
          
      
    );
  }
}