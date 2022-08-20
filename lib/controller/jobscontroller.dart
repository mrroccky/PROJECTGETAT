import 'package:apisql/Servises/jobsservises.dart';
import 'package:apisql/Servises/usergetservices.dart';
import 'package:apisql/models/jobsmodel.dart';
import 'package:apisql/models/usermodels.dart';
import 'package:get/get.dart';

class JobsController extends GetxController {
  //var JobsList = <Userdata>[].obs;

  List<JobsModel> JobsList = (List<JobsModel>.of([])).obs;
  List get user => JobsList;

  var _isLoading = true;
  bool get isLoading => _isLoading;
  @override
  void onInit() {
    fatchuser();
    super.onInit();
  }

  void fatchuser() async {
    try {
      var jobsdata = await JobsServises().GetJobs();
      if (jobsdata != null) {
        JobsList = jobsdata;
        _isLoading = false;
        update();
      } else {}
    } finally {
      _isLoading = true;
      update();
    }
  }
}
