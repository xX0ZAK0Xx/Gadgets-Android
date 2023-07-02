
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgets/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key, required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: (){
        if(!isInCart){
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(MyTheme.darkBlue),
      shape: const MaterialStatePropertyAll(StadiumBorder())),
      child: isInCart?const Icon(Icons.done) : Icon(CupertinoIcons.cart_fill_badge_plus),
    );
  }
}
