class PostModel {
  String? img;
  String? content;
  User? user;
  bool? isLiked;
  late List<String> comment;
  PostModel.fromJson(Map map) {
    img = map['image'];
    content = map['content'];
    user = User.fromJson(map['user']);
    isLiked = map['isLiked'];
    comment = map['commentList'] ?? [];
    // comment = comList.map((e) => Comment.fromJson(e)).toList();
  }
}

// class Comment {
//   String? img;
//   String? name;
//   String? content;
//   Comment.fromJson(Map map) {
//     img = map['image'];
//     name = map['name'];
//     content = map['content'];
//   }
// }

class User {
  String? img;
  String? name;
  User.fromJson(Map map) {
    img = map['image'];
    name = map['name'];
  }
}
