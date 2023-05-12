import 'dart:async';
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class BusLocation {
  static Future<LatLng?> busCoordinates({
    required String busName,
  }) async {
    try {
      var url = Uri.parse('http://192.168.127.198:5000/fetchBusLocation');

      var response = await http
          .post(url, body: {'bus_name': busName}).timeout(
              const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('Check Internet Connection');
      });
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          Map<String, dynamic> busLocation = data.first;
          double lat = busLocation['lat'];
          double lng = busLocation['lng'];
          return LatLng(lat, lng);
        }
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  
  }
}
