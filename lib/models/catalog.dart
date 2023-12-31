class CatalogModel {


  static List<Item> items=[];

  //get item by id
  Item getById(int id) => items.firstWhere((element) => element.id == id, orElse: null);
  //I will give the item id, it will give me the 1st matching item with the same id or it will return null

  //get item by position
  Item getByPos(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  int numbers = 1;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

  factory Item.fromMap(Map<dynamic, dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  
  toMap() => {
      "id": id,
      "name": name,
      "desc": desc,
      "price": price,
      "color": color,
      "image": image,
  };

}