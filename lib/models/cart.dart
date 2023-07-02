import 'package:gadgets/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel{


  //Catalog Field
  late CatalogModel _catalog;

  //Collection of ids of selected items
  final List<int> _itemIds=[];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){ 
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Calculate total price
  num get totalPrice => items.fold(0, (totalPrice, current) => totalPrice + current.price);

}

class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
} 

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
} 