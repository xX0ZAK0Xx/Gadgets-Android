import 'package:gadgets/models/catalog.dart';

class CartModel{
  //Making Singleton Model
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

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

  //Adding an item
  void addItem(Item item) => _itemIds.add(item.id);

  //Removing an item
  void removeItem(Item item) => _itemIds.remove(item.id);
}