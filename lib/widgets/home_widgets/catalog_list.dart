import 'package:flutter/material.dart';
import 'package:flutter_project_catalog/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_project_catalog/widgets/themes.dart';
import '../../models/catalogue.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  // const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog: catalog,),),),
          child: CatalogItem(catalog: catalog)
        );
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
          Hero(
            tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      catalog.name.text
                          .color(myTheme.darkBluishColor)
                          .bold
                          .make(),
                      catalog.desc.text.make(),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        buttonPadding: Vx.mOnly(right: 16),
                        children: [
                          "\$${catalog.price}".text.bold.xl.make(),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      myTheme.darkBluishColor)),
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
