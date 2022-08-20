import 'package:apisql/Screens/editpage.dart';
import 'package:apisql/Servises/userdalateservices.dart';
import 'package:flutter/material.dart';

class Poupups {

  void dalateerror({required context, required id}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Are You Sure?"),
        action: SnackBarAction(
            label: 'Dalate',
            onPressed: () {
              UserDalateServices().dalatedata(id: id);
              scaffold.hideCurrentSnackBar;
            }),
      ),
    );
  }

 

  void responsiv({required context, required massageh, required massagew}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:
            Text('h' + massageh.toString() + '\n w::' + massagew.toString()),
        action: SnackBarAction(
            label: 'ok',
            onPressed: () {
              scaffold.hideCurrentSnackBar;
            }),
      ),
    );
  }

  

  void editdetailserror(
      {required context,
      required id,
      required email,
      required mobile,
      required password}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Are You Sure?"),
        action: SnackBarAction(
            label: 'Edit Details',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditPage(id, email, mobile, password);
              }));
              scaffold.hideCurrentSnackBar;
            }),
      ),
    );
  }
}
