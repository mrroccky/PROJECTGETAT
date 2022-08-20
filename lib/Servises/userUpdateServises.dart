import 'dart:convert';

import 'package:apisql/controller/userdatacontroller.dart';
import 'package:apisql/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' as rootbundel;
import 'package:get/get.dart';

class UserUpdateservises extends GetxController {
  var isLoading = true.obs;
  static const String domain = webDomain;
  static const String updateuri = "${domain}crud/update.php";
  Future<void> updatedata({
    required id,
    required email,
    required mobile,
    required password,
  }) async {
    try {
      var res = await http.post(Uri.parse(updateuri), body: {
        "id": id.toString(),
        "email": email.toString(),
        "mobile": mobile.toString(),
        "password": password.toString(),
      });
      if (res.statusCode == 200) {
        var responce = jsonDecode(res.body);
      } else {
        print("connection faield");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
