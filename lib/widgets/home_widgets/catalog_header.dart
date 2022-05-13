import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import "package:flutter_project_catalog/widgets/themes.dart";

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
