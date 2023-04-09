import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:iicbus/Pages/editprofile.dart';
import 'package:iicbus/Pages/login.dart';
import 'package:geolocator/geolocator.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late double lat;
  late double long;

  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Permisson Denied!!");
      LocationPermission asked = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      lat = currentPosition.latitude;
      long = currentPosition.longitude;

      print(lat);
      print(long);

      return await Geolocator.getCurrentPosition();
    }
    return null;
  }

  @override
  void initState() {
    getCurrentLocation().then((value) async {
      print(value!.latitude.toString());
      print(value.longitude.toString());

      markers.add(Marker(
          markerId: MarkerId('2'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: 'My Current Location')));

      CameraPosition _kGooglePlex = CameraPosition(
        target: LatLng(26.6646, 87.2718),
        zoom: 15,
      );
    });
    // TODO: implement initState
    super.initState();
  }

  final List<Marker> markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(26.6646, 26.6646),
        infoWindow: InfoWindow(title: 'Itahari Chowk'))
  ];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.6646, 87.2718),
    zoom: 15,
  );

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
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        zoomControlsEnabled: false,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
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
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                FontAwesomeIcons.bus,
                                color: Colors.grey.shade900,
                              ),
                            ]),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.blue),
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 40)),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        )),
                                      ),
                                      onPressed: null,
                                      child: const Text(
                                        'Dharan',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.blue),
                                          padding:
                                              const MaterialStatePropertyAll(
                                                  EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 40)),
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ))),
                                      onPressed: null,
                                      child: const Text(
                                        'Inaruwa',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      )),
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.blue),
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 40)),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        )),
                                      ),
                                      onPressed: null,
                                      child: const Text(
                                        'Damak',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.blue),
                                          padding:
                                              const MaterialStatePropertyAll(
                                                  EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 40)),
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ))),
                                      onPressed: null,
                                      child: const Text(
                                        'Biratnagar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      )),
                                ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: FaIcon(
          FontAwesomeIcons.locationArrow,
          color: Colors.blue,
        ),
      ),

      // bottomNavigationBar: const Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15),
      //   child: GNav(
      //     backgroundColor: Colors.white,
      //     color: Colors.black,
      //     activeColor: Colors.black,

      //     gap: 20,
      //     tabs: [

      //       GButton(
      //         icon: Icons.home,
      //         text: 'Home',
      //         ),

      //       GButton(
      //         icon: Icons.person,
      //         text: 'Profile',

      //         ),

      //     ]

      //     ),
      // ),
    );
  }
}
