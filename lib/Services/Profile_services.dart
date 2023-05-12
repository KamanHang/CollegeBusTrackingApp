import 'dart:async';

import 'package:http/http.dart' as http;

class StudentProfile {
  static Future<String?> student({
    required String username,
    required String email,
    required String address ,
  }) async {
    try {
      var url = Uri.parse('http://192.168.127.198:5000/login');

      var response = await http
          .post(url, body: { 'email': email, 'username': username, 'address': address }).timeout(
              const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('Check Internet Connection');
      });
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  
  }
}
