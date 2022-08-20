import 'package:apisql/Servises/imagegetservices.dart';
import 'package:apisql/models/imageModel.dart';
import 'package:get/get.dart';

class ImageController extends GetxController{

  List<ImageModel> ImageList = (List<ImageModel>.of([])).obs;


  List get user => ImageList;
bool get isLoading => _isLoading;
  var _isLoading = true;
 // bool get isLoading => _isLoading;
  @override
  void onInit() {
    fatchuser();
    super.onInit();
  }

  void fatchuser() async {
    try {
      var imageData = await GetImage();
      if (imageData != null) {
        ImageList = imageData;
        _isLoading = false;
        update();
      } else {}
    } finally {
      _isLoading = true;
      update();
    }
  }
}