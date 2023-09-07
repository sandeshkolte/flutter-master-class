import 'dart:convert';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_items.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().expand()
                else
                  CircularProgressIndicator().centered().expand()
              ],
            )),
      ),
    );
  }
}