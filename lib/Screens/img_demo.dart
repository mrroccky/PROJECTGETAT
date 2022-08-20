import 'dart:convert';
import 'dart:io';
import 'package:apisql/Servises/imagegetservices.dart';
import 'package:apisql/Servises/uploadimgservieses.dart';
import 'package:apisql/controller/imageController.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ImageDemo extends StatefulWidget {
  ImageDemo({Key? key}) : super(key: key);

  @override
  State<ImageDemo> createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  File? imagePath;
  String? localImageName;
  String? localImageData;
  ImagePicker localImagePicker = ImagePicker();
  TextEditingController captionController = TextEditingController();
  final ImageController imageController = Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        imagePath != null
                            ? Column(
                                children: [
                                  Text(imagePath.toString()),
                                  Container(
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Image.file(imagePath!)),
                                ],
                              )
                            : Text("Selected image was empty!"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 50, bottom: 20),
                          child: TextFormField(
                            controller: captionController,
                            style: const TextStyle(),
                            decoration: const InputDecoration(
                                hintText: "imageName", labelText: "Bio"),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () => chooseImage(),
                            child: Text('chose Image')),
                        ElevatedButton(
                            onPressed: () {
                              if (imagePath != null &&
                                  captionController.text.isNotEmpty) {
                                postIamge();
                                print("both image and caption has data");
                              } else {
                                print("either caption or image had no data");
                              }
                            },
                            child: Text('Post ')),
                      ],
                    ),
                    Container(
                      height: 200,
                      child:
                          GetBuilder<ImageController>(builder: ((controller) {
                        if (ImageController().isLoading == true) {
                          return ListView.builder(
                              itemCount: imageController.ImageList.length,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  title: Text(
                                      imageController.ImageList[index].caption),
                                  leading: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        "http://192.168.60.31/cimg/uploads/${imageController.ImageList[index].imagePath}"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  trailing:
                                      Text(imageController.ImageList[index].id),
                                );
                              }));
                        } else {
                          return CircularProgressIndicator();
                        }
                      })),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//Text(imageController.ImageList[index].id.toString());
  Future<void> postIamge() async {
    try {
      const String postimgUri = "http://192.168.187.31/cimg/upload.php";
      var res = await http.MultipartRequest('POST', Uri.parse(postimgUri));
      res.fields['name'] = captionController.text;
      var pic = await http.MultipartFile.fromPath("image", imagePath!.path);
      res.files.add(pic);
      var response = await res.send();
      // var responce = jsonDecode(res.body);
      if (response.statusCode == 200) {
        print('Image Uploded');

        setState(() {
          captionController.text = "";
          imagePath = null;
        });
      } else {
        print('Image Not Uploded');
      }
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> chooseImage() async {
    try {
      var getImage =
          await localImagePicker.pickImage(source: ImageSource.gallery);
      imagePath = File(getImage!.path);
    } catch (e) {
      print(e.toString());
    }

    //localmage = await UploadImg().pickImage();
    setState(() {
      if (imagePath != null) {
        print(imagePath.toString());
        localImageName = imagePath!.path.split('/').last;
        localImageData = base64Encode(imagePath!.readAsBytesSync());
        print("localdata+$localImageData.toString()");
        print(localImageName);
      } else {
        print("empty");
      }
    });
  }
}
//${corseImageUrl}${CorseController().CorseList[index].image}
//CorseController().CorseList[index].tital.toString()
//CorseController().CorseList.length