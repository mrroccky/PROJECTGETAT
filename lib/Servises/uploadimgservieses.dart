import 'dart:convert';
import 'dart:typed_data';
import 'package:apisql/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class UploadImg {
  postImage() {}
  Future<String> pickImage() async {
    // XFile is now recommended to use with ImagePicker
    XFile? xfile;

    // This Line of Code will pick the image from your gallery
    xfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    //Our XFile variable is nullable so we've to check if we've picked the image or not
    if (xfile != null) {
      // Now we're converting our image into Uint8List
      Uint8List bytes = await xfile.readAsBytes();

      // Here we're converting our image to Base64
      String encode = base64Encode(bytes);

      // Returning Base64 Encoded Image
      return encode;
    } else {
      if (kDebugMode) {
        print('Pick Image First');
      }
      return 'Error';
    }
  }

  static String postimgUri = "${webDomain}imgdemo/imgdemou.php";
  Future uploadimg({required img}) async {
    try {
      if (img != null) {
        var res = await http.post(Uri.parse(postimgUri), body: {"image": img});
        if (res.statusCode == 200) {
          print(res.body);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
