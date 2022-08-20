import 'package:apisql/models/corsemodel.dart';
import 'package:apisql/models/jobsmodel.dart';
import 'package:apisql/utils/constants.dart';
import 'package:http/http.dart' as http;

class JobsServises {
  static const String getJobs = "${webDomain}${epGetJob}";
  Future<List<JobsModel>?> GetJobs() async {
    var responce = await http.get(Uri.parse(getJobs));
    if (responce.statusCode == 200) {
      var jsonString = responce.body;
      return JobsModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
