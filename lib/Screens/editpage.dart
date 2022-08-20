import 'package:apisql/Servises/userUpdateServises.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  String id;
  String email;
  String mobile;
  String password;

  EditPage(
    this.id,
    this.email,
    this.mobile,
    this.password,
  );

  TextEditingController eController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController mController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
              child: Text(
                "Edit Details",
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
                      image: AssetImage("images/dashboard.png"), height: 200),
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
                            hintText: "Enter Email Id", labelText: "email"),
                      ),
                      TextFormField(
                        //initialValue: mobile.toString(),
                        controller: mController,
                        style: const TextStyle(),
                        decoration: const InputDecoration(
                            hintText: "Enter Mobile Number",
                            labelText: "mobile"),
                      ),
                      TextFormField(
                        // initialValue: password.toString(),
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
                        UserUpdateservises().updatedata(
                            id: id,
                            email: eController.text,
                            mobile: mController.text,
                            password: pController.text);
                        Get.back();
                        /* Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListPage();
                    }));*/
                      },
                      // ignore: prefer_const_constructors
                      child: Text("Update Data"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
