class MealModel {
  String? imageUrl;
  String? name;
  String? price;
  List<Content>? contents;
  MealModel.fromJson(Map map) {
    imageUrl = map['image'];
    name = map['name'];
    price = map['price'];
    List<Map> temp = map['content'];
    contents = temp.map((e) => Content.fromJson(e)).toList();
  }
}

class Content {
  String? name;
  int? price;
  Content.fromJson(Map map) {
    name = map['name'];
    price = map['price'];
  }
}
