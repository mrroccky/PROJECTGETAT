import 'package:apisql/models/corsemodel.dart';
import 'package:apisql/utils/constants.dart';
import 'package:http/http.dart' as http;

class CorseServises {
  static const String getCorses = "${webDomain}${epGetCorses}";
  Future<List<CorseModel>?> GetCorse() async {
    var responce = await http.get(Uri.parse(getCorses));
    if (responce.statusCode == 200) {
      var jsonString = responce.body;
      return CorseModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
