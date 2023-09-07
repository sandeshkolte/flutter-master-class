import 'package:catalog_app/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          child: CatalogItem(catalog: catalog),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(catalog: catalog),
              )),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Items catalog;

  CatalogItem({super.key, required this.catalog})
      : assert(CatalogModel.items != null);

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalog.name.text.lg.bold.color(MyTheme.darkBluishColor).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor)),
                      child: "Buy".text.make())
                ],
              ).pOnly(right: 8)
            ],
          ),
        )
      ],
    )).white.rounded.square(120).make().py16();
  }
}
