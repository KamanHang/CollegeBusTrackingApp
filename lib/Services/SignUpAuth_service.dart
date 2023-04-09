import 'dart:async';

import 'package:http/http.dart' as http;

//created a class
class RegisterService {
//parsed database url

  static Future<String?> signUp({
    //creating essential variable
    required String username,
    required String email,
    required String address,
    required String password,
  }) async {
    try {
      var url = Uri.parse('http://192.168.192.198:5000/register');

      var response = await http.post(url, body: {
        'username': username,
        'email': email,
        'address': address,
        'password': password,
      }).timeout(const Duration(seconds: 10), onTimeout: () {
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
