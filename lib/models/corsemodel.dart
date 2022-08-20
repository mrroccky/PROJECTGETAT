import 'dart:convert';

List<CorseModel> CorseModelFromJson(String str) =>
    List<CorseModel>.from(json.decode(str).map((x) => CorseModel.fromJson(x)));

String CorseModelToJson(List<CorseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//[{"course_id":"1","image":"devv.png","tital":"dfd","description":"dfdf"}]
//
class CorseModel {
  CorseModel({
    required this.course_id,
    required this.image,
    required this.tital,
    required this.description,
  });

  String course_id;
  String image;
  String tital;
  String description;

  factory CorseModel.fromJson(Map<String, dynamic> json) => CorseModel(
        course_id: json["course_id"],
        image: json["image"],
        tital: json["tital"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": course_id,
        "image": image,
        "tital": tital,
        "description": description,
      };
}
