class FoodModel {
  List<Food>? food;

  FoodModel({this.food});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      food: json['food'] != null
          ? (json['food'] as List).map((i) => Food.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (food != null) {
      data['food'] = food?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Food {
  List<Childs>? childs;
  int? id;
  List<Post>? posts;
  String? title;

  Food({this.childs, this.id, this.posts, this.title});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      posts: json['posts'] != null
          ? (json['posts'] as List).map((i) => Post.fromJson(i)).toList()
          : null,
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (posts != null) {
      data['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  String? createdAt;
  String? description;
  String? full;
  int? id;
  String? image;
  String? pageId;
  String? short;
  String? title;

  Post(
      {this.createdAt,
      this.description,
      this.full,
      this.id,
      this.image,
      this.pageId,
      this.short,
      this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      createdAt: json['createdAt'],
      description: json['description'],
      full: json['full'],
      id: json['id'],
      image: json['image'],
      pageId: json['pageId'],
      short: json['short'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['description'] = description;
    data['full'] = full;
    data['id'] = id;
    data['image'] = image;
    data['pageId'] = pageId;
    data['title'] = title;
    return data;
  }
}

class Childs {
  int? id;
  String? title;
  List<Posts>? posts;
  List<Childs>? childs;

  Childs({this.id, this.title, this.posts, this.childs});

  factory Childs.fromJson(Map<String, dynamic> json) {
    return Childs(
      id: json['id'],
      title: json['title'],
      posts: json['posts'] != null
          ? (json["posts"] as List).map((i) => Posts.fromJson(i)).toList()
          : null,
      // if (json['posts'] != null) {
      //   posts = <Posts>[];
      //   json['posts'].forEach((v) {
      //     posts!.add(new Posts.fromJson(v));
      //   });
      // }
      // if (json['childs'] != null) {
      //   childs = <Null>[];
      //   json['childs'].forEach((v) {
      //     childs!.add(Posts.fromJson(v));
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? createdAt;
  String? description;
  String? full;
  int? id;
  String? image;
  String? pageId;
  String? short;
  String? title;

  Posts(
      {this.createdAt,
      this.description,
      this.full,
      this.id,
      this.image,
      this.pageId,
      this.short,
      this.title});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      createdAt: json['createdAt'],
      description: json['description'],
      full: json['full'],
      id: json['id'],
      image: json['image'],
      pageId: json['pageId'],
      short: json['short'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['description'] = description;
    data['full'] = full;
    data['id'] = id;
    data['image'] = image;
    data['pageId'] = pageId;
    data['title'] = title;
    return data;
  }
}
