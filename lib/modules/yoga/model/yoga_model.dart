import 'package:nityahealth/modules/food/model/food_model.dart';

class YogaModel {
  List<Yoga>? yoga;

  YogaModel({this.yoga});

  YogaModel.fromJson(Map<String, dynamic> json) {
    if (json['yoga'] != null) {
      yoga = <Yoga>[];
      json['yoga'].forEach((v) {
        yoga!.add(Yoga.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (yoga != null) {
      data['yoga'] = yoga!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Yoga {
  int? id;
  String? title;
  List<Posts>? posts;
  List<Childs>? childs;

  Yoga({this.id, this.title, this.posts, this.childs});

  Yoga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
    if (json['childs'] != null) {
      childs = <Childs>[];
      json['childs'].forEach((v) {
        childs!.add(Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    if (childs != null) {
      data['childs'] = childs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  String? pageId;
  String? short;
  String? full;
  String? title;
  String? description;
  String? image;
  String? createdAt;

  Posts(
      {this.id,
      this.pageId,
      this.short,
      this.full,
      this.title,
      this.description,
      this.image,
      this.createdAt});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    short = json['short'];
    full = json['full'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['page_id'] = pageId;
    data['short'] = short;
    data['full'] = full;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = createdAt;
    return data;
  }
}
