import 'package:flutter/material.dart';

class CorseDetailScreen extends StatelessWidget {
   CorseDetailScreen({
    required this.course_id,
    required this.image,
    required this.tital,
    required this.description,
  });

  String course_id;
  String image;
  String tital;
  String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.transparent,),
    body: Container(child: Column(
      children: [
        Text(course_id),
        Text(tital),
        Text(description),
        
      ],
    )),
    );
  }
}