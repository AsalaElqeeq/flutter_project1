class CatgModel {
  int? id;
  String? name;
  String? img;
  List<Product>? prod;
  CatgModel.fromJson(Map map) {
    id = map['id'];
    name = map['name'];
    img = map['image'];
    List temp = map['products'];
    prod = temp.map((e) => Product.fromJson(e)).toList();
  }
}

class Product {
  int? id;
  String? img;
  String? name;
  double? price;
  Product.fromJson(Map map) {
    id = map['id'];
    img = map['image'];
    name = map['name'];
    price = map['price'];
  }
}
