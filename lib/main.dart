import 'package:flutter/material.dart';
import 'package:flutter_project_catalog/pages/home_page.dart';
import 'package:flutter_project_catalog/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var day = "Tuesday";
    // const pi = 3.142;
    return MaterialApp(
      // home: HomePage(),
      themeMode:ThemeMode.light,//type dark remove light
      theme: ThemeData(primarySwatch:Colors.green),
      darkTheme: ThemeData (
        brightness: Brightness.dark,
      ),
      // initialRoute: "/",
      routes: {
        "/":(context) => LoginPage(),
        "/home":(context) => HomePage(),
        "/login":(context) => LoginPage(),
      },//map in flutter, dictionary in python, json in js, hover over route
    );
  }
}
