import 'dart:convert';

import 'package:apisql/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' as rootbundel;
import 'package:get/get.dart';

import '../controller/userdatacontroller.dart';

class UserDalateServices extends GetxController {
  var isDalated = false.obs;
  static const String dalateuri = "${webDomain}${epUserLogin}";
  Future<void> dalatedata({required id}) async {
    try {
      var res = http.post(Uri.parse(dalateuri), body: {"id": id.toString()});
      print("delated........");
      isDalated(true);
    } catch (e) {
      print(e.toString());
      isDalated(false);
    }
  }
}
