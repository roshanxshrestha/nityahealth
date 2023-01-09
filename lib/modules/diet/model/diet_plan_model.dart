class DietPlanModel {
  List<Purpose>? purpose;

  DietPlanModel({this.purpose});

  factory DietPlanModel.fromJson(Map<String, dynamic> json) {
    return DietPlanModel(
      purpose: json['purpose'] != null
          ? (json["purpose"] as List).map((v) => Purpose.fromJson(v)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (purpose != null) {
      data['purpose'] = purpose!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Purpose {
  int? id;
  String? purpose;
  String? createdAt;
  String? updatedAt;

  Purpose({this.id, this.purpose, this.createdAt, this.updatedAt});

  factory Purpose.fromJson(Map<String, dynamic> json) {
    return Purpose(
      id: json["id"],
      purpose: json["purpose"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['purpose'] = purpose;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
