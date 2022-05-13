import 'package:flutter/material.dart';
import 'package:flutter_project_catalog/models/catalogue.dart';
import 'package:flutter_project_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import "package:flutter_project_catalog/models/catalogue.dart";

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: myTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mOnly(right: 16),
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(myTheme.darkBluishColor)),
                child: "Buy".text.make()).wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(tag: Key(catalog.id.toString()), child: "image".text.make()),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(myTheme.darkBluishColor)
                          .bold
                          .make(),
                      catalog.desc.text.make(),
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ).p16(),
      ),
    );
  }
}
