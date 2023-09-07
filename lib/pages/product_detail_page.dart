import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.catalog});

  final Items catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.green700.xl4.make(),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkBluishColor)),
                child: "Buy".text.xl.makeCentered().wh(100, 50))
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child:
                    Image.network(catalog.image).centered().h32(context).p(5)),
            Expanded(
                child: VxArc(
              height: 30.0,
              edge: VxEdge.top,
              arcType: VxArcType.convey,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold
                        .color(MyTheme.darkBluishColor)
                        .make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  ],
                ).py64(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
