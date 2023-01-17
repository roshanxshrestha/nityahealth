class WellnessListModel {
  List<WellnessPage>? wellnessPage;

  WellnessListModel({this.wellnessPage});

  WellnessListModel.fromJson(Map<String, dynamic> json) {
    if (json['wellness_page'] != null) {
      wellnessPage = <WellnessPage>[];
      json['wellness_page'].forEach((v) {
        wellnessPage!.add(WellnessPage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wellnessPage != null) {
      data['wellness_page'] = wellnessPage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WellnessPage {
  int? id;
  String? title;
  List<Posts>? posts;

  WellnessPage({this.id, this.title, this.posts});

  factory WellnessPage.fromJson(Map<String, dynamic> json) {
    return WellnessPage(
      id: json['id'],
      title: json['title'],
      posts: json["posts"] != null
          ? (json["posts"] as List).map((e) => Posts.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
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
