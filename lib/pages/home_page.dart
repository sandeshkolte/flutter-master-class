import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

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
    await Future.delayed(const Duration(seconds: 2));
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
      appBar: AppBar(
        title: Text("Catalog App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:(CatalogModel.items!=null && CatalogModel.items!.isNotEmpty)? ListView.builder(
          itemCount: CatalogModel.items!.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items![index],
            );
          },
        ): Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
