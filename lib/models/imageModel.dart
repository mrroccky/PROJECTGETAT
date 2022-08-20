// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

List<ImageModel> imageModelFromJson(String str) => List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

String imageModelToJson(List<ImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel {
    ImageModel({
       required this.id,
       required this.caption,
       required this.imagePath,
    });

    String id;
    String caption;
    String imagePath;

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        caption: json["caption"],
        imagePath: json["image_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "image_path": imagePath,
    };
}


























// import 'dart:convert';
// import 'dart:io';
// import 'package:apisql/Screens/more/hd.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;



// class DemoUploadImage extends StatefulWidget {
//   @override
//   _DemoUploadImageState createState() => _DemoUploadImageState();
// }

// class _DemoUploadImageState extends State<DemoUploadImage> {
//   File? _image;
//   final picker = ImagePicker();
//   TextEditingController nameController = TextEditingController();

//   Future choiceImage() async {
//     var pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = File(pickedImage!.path);
//     });
//   }

//   Future uploadImage() async {
//     final uri = Uri.parse("http://192.168.197.31/cimg/upload.php");
//     var request = http.MultipartRequest('POST', uri);
//     request.fields['name'] = nameController.text;
//     var pic = await http.MultipartFile.fromPath("image", _image!.path);
//     request.files.add(pic);
//     var response = await request.send();

//     if (response.statusCode == 200) {
//       print('Image Uploded');
//     } else {
//       print('Image Not Uploded');
//     }
//     setState(() {});
//   }

//   String _mySelection = "";
//   List<Map> _myJson = [
//     {"id": 0, "name": "<New>"},
//     {"id": 1, "name": "Test Practice"}
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.camera),
//               onPressed: () {
//                 choiceImage();
//               },
//             ),
//             Container(
//               child: _image == null
//                   ? Text('No Image Selected')
//                   : Image.file(_image!),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             // ElevatedButton(
//             //   child: Text('Upload Image'),
//             //   onPressed: () {
//             //     uploadImage();
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //         builder: (context) => AllPersonData(),
//             //       ),
//             //     );
//             //   },
//             // ),
//             Center(
//               child: DropdownButton(
//                 isDense: true,
//                 hint: const Text("Select"),
//                 value: _mySelection,
//                 onChanged: (newValue) {
//                   setState(() {
//                     // _mySelection = newValue;
//                   });

//                   print(_mySelection);
//                 },
//                 items: _myJson.map((Map map) {
//                   return new DropdownMenuItem(
//                     value: map["id"].toString(),
//                     child: new Text(
//                       map["name"],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
