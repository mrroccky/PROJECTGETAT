import 'package:apisql/Servises/newsservises.dart';
import 'package:apisql/models/newsmodel.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  //var JobsList = <Userdata>[].obs;

  List<NewsModel> NewsList = (List<NewsModel>.of([])).obs;
  List get user => NewsList;

  var _isLoading = true;
  bool get isLoading => _isLoading;
  @override
  void onInit() {
    fatchNews();
    super.onInit();
  }

  void fatchNews() async {
    try {
      var newsdata = await NewsServises().GetNews();
      if (newsdata != null) {
        NewsList = newsdata;
        _isLoading = false;
        update();
      } else {}
    } finally {
      _isLoading = true;
      update();
    }
  }
}
