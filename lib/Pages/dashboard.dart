import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../Services/fetchBusLocation.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String location = "Dharan";

  Completer<GoogleMapController> controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.6646, 87.2718),
    zoom: 15,
  );

  void popup() {
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
          content: const Text(
            'Please enable your device location',
            style: TextStyle(color: Colors.redAccent),
          ),
        );
      },
    );
  }


  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
        print('Permission not given');
        
        Future<LocationPermission> asked = Geolocator.requestPermission();
    } else {
        return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
    }
    return null;
}


  Set<Marker> markers = {};
  Set<Polyline> polyline = {};
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  BitmapDescriptor studentIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor busIcon = BitmapDescriptor.defaultMarker;

  Future<LatLng?> getUserLocation() async {
    Position? position = await getCurrentLocation();

    if (position == null) {
      popup();
    } else {
      GoogleMapController kcontroller = await controller.future;
      kcontroller.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(
              position.latitude,
              position.longitude,
            ),
            zoom: 16)),
      );
      setState(() {
        markers.clear();
        markers.add(Marker(
            markerId: const MarkerId('currentLocation'),
            infoWindow: const InfoWindow(title: 'Your Location'),
            position: LatLng(
              position.latitude,
              position.longitude,
            ),
            icon: studentIcon));
      });
      return LatLng(position.latitude, position.longitude);
    }
  }

  @override
  void initState() {
    polylinePoints = PolylinePoints();
    addCustomMarker();
    // TODO: implement initState
    super.initState();
  }

  void addCustomMarker() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/student.png")
        .then((icon) {
      setState(() {
        studentIcon = icon;
      });
    });

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/bus.png")
        .then((icon) {
      setState(() {
        busIcon = icon;
      });
    });
  }

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
        onMapCreated: (GoogleMapController kcontroller) {
          controller.complete(kcontroller);
        },
        markers: markers,
        polylines: polyline,
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            backgroundColor: Colors.white,
            onPressed: () {
              getUserLocation();
            },
            child: const FaIcon(
              FontAwesomeIcons.locationCrosshairs,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 2,
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
                                            padding:
                                                const MaterialStatePropertyAll(
                                                    EdgeInsets.symmetric(
                                                        horizontal: 40,
                                                        vertical: 40)),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            )),
                                          ),
                                          onPressed: () async {
                                            location = "Dharan";
                                            LatLng? userLocation =
                                                await getUserLocation(); // or replace this with a user-selected location
                                            setPolylines(userLocation!);
                                          },
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
                                            padding:
                                                const MaterialStatePropertyAll(
                                                    EdgeInsets.symmetric(
                                                        horizontal: 40,
                                                        vertical: 40)),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            )),
                                          ),
                                          onPressed: () async {
                                            location = "Biratnagar";

                                            LatLng? userLocation =
                                                await getUserLocation(); // or replace this with a user-selected location
                                            setPolylines(
                                                userLocation!);
                                          },
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
                                          onPressed: () async {
                                            location = "Biratnagar";

                                            LatLng? userLocation =
                                                await getUserLocation(); // or replace this with a user-selected location
                                            setPolylines(
                                                userLocation!);
                                          },
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
              FontAwesomeIcons.bus,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

// Method to fetch user location and bus location from database and show polylines between them
  void setPolylines(LatLng userLocation) async {
    LatLng? busLocation = await BusLocation.busCoordinates(busName: location);

    if(busLocation != null){

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBWaWxe-mTUQ6nozsqNbQcX5yXaalEnUY0",
        PointLatLng(userLocation.latitude, userLocation.longitude),
        PointLatLng(busLocation.latitude, busLocation.longitude)
      );

    if (result.status == 'OK') {
      List<LatLng> polylineCoordinates = [];

      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      GoogleMapController kcontroller = await controller.future;
      kcontroller.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(
              userLocation.latitude,
              userLocation.longitude,
            ),
            zoom: 11.5)),
      );

      setState(() {
        markers.clear();
        markers.add(Marker(
            markerId: const MarkerId('currentLocation'),
            infoWindow: const InfoWindow(title: 'Your Location'),
            position: LatLng(
              userLocation.latitude,
              userLocation.longitude,
            ),
            icon: studentIcon));

        markers.add(Marker(
            markerId: const MarkerId('destination'),
            infoWindow: const InfoWindow(title: 'Bus Location'),
            position: LatLng(
              busLocation.latitude,
              busLocation.longitude,
            ),
            icon: busIcon));
      });

      setState(() {
        polyline.clear();
        polyline.add(Polyline(
            polylineId: PolylineId('polyline2'),
            color: Colors.orange,
            width: 5,
            points: polylineCoordinates));
      });
    } else {
      print(result.errorMessage);
    }

    }
    else{
      print("Error");
    }
    
  }
}
