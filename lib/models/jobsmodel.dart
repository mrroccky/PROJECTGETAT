import 'dart:convert';

List<JobsModel> JobsModelFromJson(String str) => List<JobsModel>.from(json.decode(str).map((x) => JobsModel.fromJson(x)));

String JobsModelToJson(List<JobsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobsModel {
    JobsModel({
       required this.id,
       required this.publisher_id,
       required this.image,
       required this.head_line,
       required this.job_type,
       required this.job_location,
       required this.salary_offred,
       required this.permanent,
       required this.job_descreption,
       required this.contact,
       required this.publisher_image,
       required this.publisher_name,
    });

    String id;
    String publisher_id;
    String image;
    String head_line;
    String job_type;
    String job_location;
    String salary_offred;
    String permanent;
    String job_descreption;
    String contact;
    String publisher_image;
    String publisher_name;

    factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        id: json["id"],
        publisher_id: json["publisher_id"],
        image: json["image"],
        head_line: json["head_line"],
        job_type: json["job_type"],
        job_location: json["job_location"],
        salary_offred: json["salary_offred"],
        permanent: json["permanent"],
        job_descreption: json["job_descreption"],
        contact: json["contact"],
        publisher_image: json["publisher_image"],
        publisher_name: json["publisher_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "publisher_id": publisher_id,
        "image":image,
        "head_line":head_line,
        "job_type": job_type,
        "job_location":job_location,
        "salary_offred":salary_offred,
        "permanent": permanent,
        "job_descreption":job_descreption,
        "contact": contact,
        "publisher_image":publisher_image,
        "publisher_name":publisher_name,
        
    };
}
