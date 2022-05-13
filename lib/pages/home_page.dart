// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_project_catalog/models/catalogue.dart';
import 'package:flutter_project_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogjson);
    var productsData = decodedData["products"];
    // print(productsData);
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    // int days = 30;
    // String name = "Shahbaz";
    return Scaffold(
        backgroundColor: myTheme.creamColor,
        // appBar: AppBar(
        //   title: Text(
        //     "Catalog App",
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else CircularProgressIndicator().centered().expand(),
                  
              ],
            ),
          ),
        )

        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //       ?
        //       // ListView.builder(
        //       //   itemCount: CatalogModel.items.length,
        //       //   itemBuilder: (context, index) {
        //       //     return ItemWidget(
        //       //       item: CatalogModel.items[index],
        //       //       key: null,
        //       //     );
        //       //   },
        //       // )
        //       GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             mainAxisSpacing: 16,
        //             crossAxisSpacing: 16,
        //           ),
        //           itemBuilder: (context, index) {
        //             final item = CatalogModel.items[index];
        //             return Card(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(15)),
        //                 child: GridTile(
        //                   header: Text(item.name),
        //                   child: Text(item.name),
        //                   footer: Text(item.price.toString()),
        //                 ));
        //           },
        //           itemCount: CatalogModel.items.length,
        //         )
        //       : Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // ),
        // drawer: myDrawer(),
        );
  }
}


