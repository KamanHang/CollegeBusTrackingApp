import 'dart:async';

import 'package:http/http.dart' as http;

class LoginStudent {
  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      var url = Uri.parse('http://192.168.192.198:5000/login');

      var response = await http
          .post(url, body: {'email': email, 'password': password}).timeout(
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
