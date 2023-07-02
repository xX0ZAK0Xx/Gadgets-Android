import 'package:gadgets/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';

class MyStore extends VxStore{
  late CartModel cart;
  late CatalogModel catalog;

  MyStore(){
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog; 
  }
}