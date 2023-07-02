import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgets/models/catalog.dart';
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
          _CartList().p16().expand(),
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
          VxConsumer(
            builder: (context,_, __){
              return "\$${_cart.totalPrice}".text.xl4.make();
            },
            mutations: {RemoveMutation, DecrementMutation, IncrementMutation},
          ),
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
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty? "Nothing in your Cart".text.make() : ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index)=> ListTile(
        trailing: IconButton(
          onPressed: ()=> {
            _cart.items[index].numbers = 1,
            RemoveMutation(_cart.items[index])
          },
          icon: Icon(Icons.delete_outline_rounded)
        ),
        leading: _cart.items[index].name.text.make(),
        title: Quantity(item: _cart.items[index]),
      ),
    );
  }
}

class Quantity extends StatelessWidget {
  final Item item;
  const Quantity({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[DecrementMutation, IncrementMutation]);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: ()=> item.numbers>1? DecrementMutation(item) :() {}, 
          icon: Icon(CupertinoIcons.minus)
        ),
        Container(
          width: 15,
          color: Colors.white,
          child: "${item.numbers}".text.align(TextAlign.center).make(),
        ),
        IconButton(
          onPressed: ()=> item.numbers<5? IncrementMutation(item)  :(){}, 
          icon: Icon(CupertinoIcons.add)
        ),
      ],
    );
  }
}