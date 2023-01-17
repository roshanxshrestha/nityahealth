class WellnessChildModel {
  List<WellnessChild>? wellnessChild;

  WellnessChildModel({this.wellnessChild});

  WellnessChildModel.fromJson(Map<String, dynamic> json) {
    if (json['wellnessChild'] != null) {
      wellnessChild = <WellnessChild>[];
      json['wellnessChild'].forEach((v) {
        wellnessChild!.add(WellnessChild.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wellnessChild != null) {
      data['wellnessChild'] = wellnessChild!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WellnessChild {
  int? id;
  String? title;
  String? icon;

  WellnessChild({this.id, this.title, this.icon});

  WellnessChild.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icon'] = icon;
    return data;
  }
}
