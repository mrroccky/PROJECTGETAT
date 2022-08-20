import 'package:apisql/models/imageModel.dart';
import 'package:apisql/utils/constants.dart';
import 'package:http/http.dart' as http;

Future<List<ImageModel>?> GetImage() async {
  const String domain = webDomain;
  const String imageData = "${webDomain}cimg/view.php";
  var responce = await http.get(Uri.parse(imageData));

  if (responce.statusCode == 200) {
    var jsonString = responce.body;
    print("okkReciveddata............" + responce.body.toString());

    return imageModelFromJson(jsonString);
  } else {
    print("error............." + responce.body.toString());
    return null;
  }
}
