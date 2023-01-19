class FitnessModel {
  List<Fitness>? fitness;

  FitnessModel({this.fitness});

  FitnessModel.fromJson(Map<String, dynamic> json) {
    if (json['fitness'] != null) {
      fitness = <Fitness>[];
      json['fitness'].forEach((v) {
        fitness!.add(Fitness.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fitness != null) {
      data['fitness'] = fitness!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fitness {
  int? id;
  String? title;
  List<Posts>? posts;
  List<Childs>? childs;

  Fitness({this.id, this.title, this.posts, this.childs});

  Fitness.fromJson(Map<String, dynamic> json) {
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

class Childs {
  int? id;
  String? title;
  List<Posts>? posts;
  List<Childs>? childs;

  Childs({this.id, this.title, this.posts, this.childs});

  Childs.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
