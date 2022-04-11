import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Shahbaz";
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
        body: Center(
      child: Container(
        child: Text("Welcome To $days days of Flutter by $name"),
      ),
    ),
    drawer: Drawer(),
    );
    
  }
}
