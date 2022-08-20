import 'package:apisql/Servises/usergetservices.dart';
import 'package:apisql/models/usermodels.dart';
import 'package:get/get.dart';

class UserDataContorleer extends GetxController {
  //var UeserList = <Userdata>[].obs;

  List<Userdata> UeserList = (List<Userdata>.of([])).obs;
  List get user => UeserList;

  var _isLoading = true;
  bool get isLoading => _isLoading;
  @override
  void onInit() {
    fatchuser();
    super.onInit();
  }

  void fatchuser() async {
    try {
      var userdata = await UserServicess().fatchuser();
      if (userdata != null) {
        UeserList = userdata;
        _isLoading = false;
        update();
      } else {}
    } finally {
      _isLoading = true;
      update();
    }
  }
}
