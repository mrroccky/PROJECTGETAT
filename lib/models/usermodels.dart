// To parse this JSON data, do
//
//     final userdata = userdataFromJson(jsonString);

import 'dart:convert';

List<Userdata> userdataFromJson(String str) =>
    List<Userdata>.from(json.decode(str).map((x) => Userdata.fromJson(x)));

String userdataToJson(List<Userdata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Userdata {
  Userdata({
    required this.id,
    required this.email,
    required this.mobile,
    required this.password,
  });

  String id;
  String email;
  String mobile;
  String password;

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "mobile": mobile,
        "password": password,
      };
}
