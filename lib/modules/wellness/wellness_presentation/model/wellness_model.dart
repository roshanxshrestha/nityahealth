class WellnessModel {
  List<Wellness>? wellness;

  WellnessModel({this.wellness});

  WellnessModel.fromJson(Map<String, dynamic> json) {
    if (json['wellness'] != null) {
      wellness = <Wellness>[];
      json['wellness'].forEach((v) {
        wellness!.add(Wellness.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wellness != null) {
      data['wellness'] = wellness!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wellness {
  int? id;
  String? title;
  String? icon;

  Wellness({this.id, this.title, this.icon});

  Wellness.fromJson(Map<String, dynamic> json) {
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
