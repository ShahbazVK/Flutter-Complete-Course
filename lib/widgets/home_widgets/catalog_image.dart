
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_project_catalog/widgets/themes.dart';

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

