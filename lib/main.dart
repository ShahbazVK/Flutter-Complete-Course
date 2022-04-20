import 'package:flutter/material.dart';
import 'package:flutter_project_catalog/pages/home_page.dart';
import 'package:flutter_project_catalog/pages/login_page.dart';
import 'package:flutter_project_catalog/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var day = "Tuesday";
    // const pi = 3.142;
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // home: HomePage(),
      themeMode:ThemeMode.light,//type dark remove light
      theme: ThemeData(primarySwatch:Colors.green),
      darkTheme: ThemeData (
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/":(context) => LoginPage(),
        MyRoutes.homeRoute:(context) => HomePage(),
        MyRoutes.loginRoute:(context) => LoginPage(),
      },//map in flutter, dictionary in python, json in js, hover over route
    );
  }
}
