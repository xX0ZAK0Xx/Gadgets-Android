
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../themes.dart';

class CatalogItem extends StatelessWidget {
  final Item item;
  const CatalogItem ({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(item.id.toString()),
            child: ItemImage(image: item.image)
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.name.text.lg.bold.make(),
                item.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${item.price}".text.xl.make(),
                    ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(MyTheme.darkBlue)),
                      child: "Buy".text.lg.bold.make()
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}

class ItemImage extends StatelessWidget {
  final String image;
  const ItemImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.make().p16().w40(context);
  }
}