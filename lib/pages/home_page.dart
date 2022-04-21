// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Shahbaz";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome To $days days of Flutter by $name"),
        ),
      ),
      drawer: myDrawer(),
    );
  }
}
