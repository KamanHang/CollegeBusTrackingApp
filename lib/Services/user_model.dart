import 'dart:convert';

List<UserDetails> userDetailsFromJson(String str) => List<UserDetails>.from(json.decode(str).map((x) => UserDetails.fromJson(x)));

String userDetailsToJson(List<UserDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetails {
    UserDetails({
        required this.id,
        required this.username,
        required this.collegeMail,
        required this.address,
        required this.password,
    });

    int id;
    String username;
    String collegeMail;
    String address;
    String password;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        username: json["username"],
        collegeMail: json["college_mail"],
        address: json["address"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "college_mail": collegeMail,
        "address": address,
        "password": password,
    };
}