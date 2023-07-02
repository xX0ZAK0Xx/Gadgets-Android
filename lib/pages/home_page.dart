import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:gadgets/widgets/my_drawer.dart';
// import 'package:gadgets/widgets/item_widget.dart';
import 'package:gadgets/models/catalog.dart';
import 'dart:convert';
import 'package:gadgets/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';
import '../widgets/home_widgets/catalog_item.dart';
import 'home_detail_page.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "Md. Zayed Oyshik";

  
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");// gets the json file as a string from the drirectory
    var decodeData = jsonDecode(catalogJson); //retruns the json object
    var productsData = decodeData["products"]; //from the json object it returns the value of the products key
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    ///CatalogModel has a list of Item called items.. then a list of productsData is made. then the list of items  is iterated and passed each item to the fromMap function that returns an Item object. finally the object is  stored into the items list.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartPage),
        backgroundColor: MyTheme.darkBlue,
        child: const Icon(CupertinoIcons.cart),
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(child: Container(
        padding: Vx.m16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              const CatalogList().expand()
            else
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  CircularProgressIndicator(backgroundColor: MyTheme.darkBlue, color: MyTheme.creamColor,),
                ] 
              )
            )
          ],
        ),
      )),
    );
  }
}
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.make(),
        "Our most sold products-".text.color(Colors.blueGrey).make(),
        SizedBox(height: 20,),
      ],
    );
  }
}


class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final item = CatalogModel.getByPos(index);
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailPage(item: item,)) ),
          child: CatalogItem(item: item)
        );
      }
    );
  }
}
