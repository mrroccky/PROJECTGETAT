import 'package:apisql/models/usermodels.dart';
import 'package:apisql/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserServicess {
  static const String domain = webDomain;
  static const String getdata = "${domain}crud/getdata.php";
  Future<List<Userdata>?> fatchuser() async {
    var responce = await http.get(Uri.parse(getdata));
    if (responce.statusCode == 200) {
      var jsonString = responce.body;
      return userdataFromJson(jsonString);
    } else {
      return null;
    }
  }
}
