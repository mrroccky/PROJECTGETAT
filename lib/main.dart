import 'package:apisql/Screens/loginpage.dart';
import 'package:apisql/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const myApp(),
  );
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      debugShowCheckedModeBanner: false,
      home: LogInPage(),
    );
  }
}
