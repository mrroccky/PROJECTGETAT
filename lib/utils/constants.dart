import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 36, 202, 202);
const kSecondaryColor = Color.fromARGB(255, 36, 202, 202);
const kContentColorLightTheme =
    Color.fromARGB(220, 54, 54, 85); //darktheme backgraund colour
const kContentColorDarkTheme = Color(
    0xFFF5FCF9); //whitetheme backgraund//darktheme Icon theme data//dark text data colour
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;
/*
getat/getatjobs/getletestjobs.php
getat/getatjobs/postjob.php
getat/getatjobspublisher/jobspublisherlogin.php
getat/registereduser/userlogin.php
getat/corses/getcorses.php
getat/corses/addcourses.php
*/

//main website link
const String webDomain = 'http://192.168.241.31/';

//all endpoints
const String epGetJob = 'getat/getatjobs/getletestjobs.php';
const String epPostJob = 'getat/getatjobs/postjob.php';
const String epPublisherlogin =
    'getat/getatjobspublisher/jobspublisherlogin.php';
const String epUserLogin = 'getat/registereduser/userlogin.php';
const String epGetCorses = 'getat/corses/getcorses.php';
const String epPostCorses = 'getat/corses/addcourses.php';

// full link to parse on http request

String corsesimagepath = '${webDomain}getat/corses/uploads/';
String jobimagepath = '${webDomain}getat/getatjobs/uploads/';
//http://192.168.60.31/cimg/uploads/${imageController.ImageList[index].imagePath}"