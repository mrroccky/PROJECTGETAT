import 'dart:convert';
import 'package:apisql/controller/userdatacontroller.dart';
import 'package:apisql/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AddUserServices extends GetxController {
  static const String inserturi = "${webDomain}${epUserLogin}";
  Future<void> adduser({
    required email,
    required mobile,
    required password,
  }) async {
    if (email.text == "" || mobile.text == "" || password.text == "") {
      print("enter proper details");
    } else {
      try {
        var res = await http.post(
          Uri.parse(inserturi),
          body: {
            "email": email.text,
            "mobile": mobile.text,
            "password": password.text,
          },
        );
        var responce = jsonDecode(res.body);
        print(res.body.toString());
        if (responce["sucsses"] == true) {
          print("record inserted");
        } else {
          print("some error ");
        }
      } catch (e) {
        print("some exeption occured");
        print(e);
      }
    }
  }
}
