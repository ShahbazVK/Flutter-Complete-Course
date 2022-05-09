// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_project_catalog/models/catalogue.dart';
import 'package:flutter_project_catalog/widgets/item_widget.dart';
import 'package:flutter_project_catalog/widgets/themes.dart';
import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

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

class CatalogList extends StatelessWidget {
  // const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  // const CatalogItem({ Key? key }) : super(key: key);
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                children: [
                  catalog.name.text.color(myTheme.darkBluishColor).bold.make(),
                  catalog.desc.text.make(),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: Vx.mOnly(right: 16),
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(myTheme.darkBluishColor)
                        ),
                       child: "Buy".text.make())
                    ],
                  )
                ],
              )
            ]),
          )
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  // const CatalogImage({ Key? key }) : super(key: key);
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(image)
        .box
        .roundedLg
        .p8
        .color(myTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("Catalog App"),
        "Catalog App".text.bold.xl5.color(myTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
