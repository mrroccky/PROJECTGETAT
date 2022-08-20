import 'dart:ui';
import 'package:apisql/Screens/home.dart';
import 'package:apisql/Screens/img_demo.dart';
import 'package:apisql/Screens/listview.dart';
import 'package:apisql/Servises/userUpdateServises.dart';
import 'package:apisql/utils/poupups.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Servises/aduserServices.dart';

class LogInPage extends StatelessWidget {
  final UserUpdateservises userUpdateservises = Get.put(UserUpdateservises());
  TextEditingController eController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController mController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textscal = MediaQuery.of(context).textScaleFactor;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 2, right: 2),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  child: Image(
                      image: AssetImage("images/splash.png"), height: 200),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 2,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: eController,
                        style: const TextStyle(),
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Enter Email Id",
                            labelText: "email"),
                      ),
                      TextFormField(
                        controller: mController,
                        style: const TextStyle(),
                        decoration: const InputDecoration(
                            hintText: "Enter Mobile Number",
                            labelText: "mobile"),
                      ),
                      TextFormField(
                        controller: pController,
                        style: const TextStyle(),
                        decoration: const InputDecoration(
                            hintText: "Enter Password", labelText: "password"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Adding data button
                    ElevatedButton(
                      onPressed: () {
                        print("performing ad data...");
                        // sqlDb().adduser(
                        //     email: eController,
                        //     mobile: mController,
                        //     password: pController);
                        AddUserServices().adduser(
                            email: eController,
                            mobile: mController,
                            password: pController);
                        eController.text = "";
                        pController.text = "";
                        mController.text = "";
                      },
                      // ignore: prefer_const_constructors
                      child: Text("Adddata"),
                    ),
                    //goto user page
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => Listview());
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return ListPage();
                        // }));
                      },
                      // ignore: prefer_const_constructors
                      child: Text("User Details"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 2),
                  child: ElevatedButton(
                    //style: const ButtonStyle(shape: BoxBorder(BorderRadius.all(12))),
                    onPressed: () {
                      Poupups().responsiv(
                          context: context, massageh: height, massagew: width);
                      Get.to(() => Home());
                    },
                    // ignore: prefer_const_constructors
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Login With"),
                        Icon(Icons.supervised_user_circle),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 2),
                  child: ElevatedButton(
                    //style: const ButtonStyle(shape: BoxBorder(BorderRadius.all(12))),
                    onPressed: () {
                      Poupups().responsiv(
                          context: context, massageh: height, massagew: width);
                      Get.to(() => ImageDemo());
                    },
                    // ignore: prefer_const_constructors
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("ImgDemo"),
                        Icon(Icons.supervised_user_circle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
