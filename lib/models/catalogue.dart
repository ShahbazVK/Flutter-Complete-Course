class CatalogModel {
  static List <Item> items = [
    // Item( 
    //     id: 1,
    //     name: "Iphone 12 pro",
    //     desc: "4th generation",
    //     price: 999,
    //     color: "#33505a",
    //     image: "imagw"),
    // Item(
    //     id: 1,
    //     name: "Iphone 12 pro",
    //     desc: "4th generation",
    //     price: 999,
    //     color: "#33505a",
    //     image: "imagw")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
//curly braces ka scene
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
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
