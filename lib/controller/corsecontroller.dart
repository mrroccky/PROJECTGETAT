import 'package:apisql/Servises/corseservises.dart';
import 'package:apisql/models/corsemodel.dart';
import 'package:get/get.dart';

class CorseController extends GetxController {
  //var CorseList = <CorseList>[].obs;

  List<CorseModel> CorseList = (List<CorseModel>.of([])).obs;
  List get corselist => CorseList;

  var _isLoading = true;
  bool get isLoading => _isLoading;
  @override
  void onInit() {
    getcorse();
    super.onInit();
  }

  void getcorse() async {
    try {
      var corse = await CorseServises().GetCorse();

      if (corse != null) {
        CorseList = corse;
        _isLoading = false;
        update();
      } else {}
    } finally {
      _isLoading = true;
      update();
    }
  }
}
