import 'package:apisql/Screens/editpage.dart';
import 'package:apisql/controller/userdatacontroller.dart';
import 'package:apisql/models/usermodels.dart';
import 'package:apisql/utils/poupups.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Listview extends StatefulWidget {
  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    final UserDataContorleer userDataContorleer = Get.put(UserDataContorleer());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<UserDataContorleer>(
        builder: ((controller) {
          if (controller.isLoading == true) {
            return ListView.builder(
              itemCount: userDataContorleer.UeserList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPress: (() {
                    Poupups().dalateerror(
                        context: context,
                        id: userDataContorleer.UeserList[index].id);
                    print(userDataContorleer.UeserList[index].id);
                  }),
                  onDoubleTap: () {
                    Get.to(() => EditPage(
                        userDataContorleer.UeserList[index].id,
                        userDataContorleer.UeserList[index].email,
                        userDataContorleer.UeserList[index].mobile,
                        userDataContorleer.UeserList[index].password));
                  },
                  child: ListTile(
                    leading: Text(
                      userDataContorleer.UeserList[index].email.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    title: Opacity(
                      opacity: 0.64,
                      child: Text(
                        userDataContorleer.UeserList[index].mobile.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    trailing: Opacity(
                        opacity: 0.64,
                        child: Text(
                          userDataContorleer.UeserList[index].id.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
