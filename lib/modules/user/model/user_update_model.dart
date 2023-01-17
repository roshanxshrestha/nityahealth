class UserUpdateModel {
  Data? data;
  String? message;
  bool? success;
  UserUpdateModel({this.data, this.message, this.success});

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) {
    return UserUpdateModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json["message"],
      success: json["success"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message as String;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? token;
  Data({
    this.name,
    this.token,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["token"] = token;
    return data;
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json["name"],
      token: json["token"],
    );
  }
}
