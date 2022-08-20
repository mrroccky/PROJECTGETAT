import 'package:apisql/models/newsmodel.dart';
import 'package:apisql/utils/constants.dart';
import 'package:http/http.dart' as http;

class NewsServises {
  static const String getNews = "${webDomain}${epGetNews}";
  Future<List<NewsModel>?> GetNews() async {
    var responce = await http.get(Uri.parse(getNews));
    if (responce.statusCode == 200) {
      var jsonString = responce.body;
      return NewsModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
