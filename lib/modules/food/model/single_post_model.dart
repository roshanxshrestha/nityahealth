class SinglePostModel {
  Post? post;

  SinglePostModel({this.post});

  SinglePostModel.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (post != null) {
      data['post'] = post!.toJson();
    }
    return data;
  }
}

class Post {
  int? id;
  String? pageId;
  String? short;
  String? full;
  String? title;
  String? description;
  String? image;
  String? createdAt;

  Post(
      {this.id,
      this.pageId,
      this.short,
      this.full,
      this.title,
      this.description,
      this.image,
      this.createdAt});

  Post.fromJson(Map<String, dynamic> json) {
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
