import 'package:flutter/material.dart';

class JobDetailScreen extends StatelessWidget {
  JobDetailScreen({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Text(id),
            Text(publisher_id),
            Text(head_line),
            Text(job_type),
            Text(job_location),
            Text(permanent),
            Text(job_descreption),
            Text(contact),
            Text(publisher_name),
          ],
        ),
      ),
    );
  }
}
