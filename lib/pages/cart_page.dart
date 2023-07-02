import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
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
    final CartModel _cart = (VxState.store as MyStore).cart;
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

class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? "Nothing in your Cart".text.make() : ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index)=> ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: (){
            _cart.removeItem(_cart.items[index]);
            _cart.totalPrice;
            // setState(() {});
          },
          icon: Icon(Icons.remove)
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}