import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../widgets/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "My Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
          
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.make(),
          WidthBox(30),
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Center(child:"Buying not supported yet".text.make()),)
              );
            },
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(MyTheme.darkBlue),
            shape: MaterialStatePropertyAll(StadiumBorder())),
            child: "Buy".text.xl3.make()
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index)=> ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: (){},
          icon: Icon(Icons.remove)
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}