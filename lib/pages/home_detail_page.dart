import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item item;
  const HomeDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: MyTheme.creamColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${item.price}".text.xl3.bold.make(),
            ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(MyTheme.darkBlue), shape: MaterialStatePropertyAll(StadiumBorder())),
              child: "Add to Cart".text.lg.bold.make()
            ).w32(context),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(item.id.toString()),
              child: Center(child: Image.network(item.image))
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 20,
                edge: VxEdge.top,
                arcType: VxArcType.convey,
                child: Container(
                  width: context.screenWidth,
                  color: MyTheme.creamColor,
                  child: Column(
                    children: [
                      item.name.text.xl5.bold.make(),
                      item.desc.text.xl.textStyle(context.captionStyle).make(),
                    ],
                  ).py32(),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}