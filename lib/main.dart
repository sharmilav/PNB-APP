import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innlite_mobile/View/login_page.dart';
import 'package:innlite_mobile/View/splash_screen.dart';

import 'View/dashboard_view.dart';
import 'httpoverrides.dart';



void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash(),debugShowCheckedModeBanner: false,theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}


