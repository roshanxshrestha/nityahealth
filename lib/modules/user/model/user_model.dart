class UserModel {
  User? user;

  UserModel({this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? age;
  String? gender;
  String? weight;
  String? height;
  String? address;
  String? meals;
  String? phone;
  String? image;
  // List<dynamic>? mconditions;
  // List<dynamic>? mrecords;

  User({
    this.id,
    this.name,
    this.email,
    this.age,
    this.gender,
    this.weight,
    this.height,
    this.address,
    this.meals,
    this.phone,
    this.image,
    /*this.mconditions,
      this.mrecords*/
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    gender = json['gender'];
    weight = json['weight'];
    height = json['height'];
    address = json['address'];
    meals = json['meals'];
    phone = json['phone'];
    image = json['image'];
    // if (json['mconditions'] != null) {
    //   mconditions = <Null>[];
    //   json['mconditions'].forEach((v) {
    //     mconditions!.add(new dynamic.fromJson(v));
    //   });
    // }
    // if (json['mrecords'] != null) {
    //   mrecords = <Null>[];
    //   json['mrecords'].forEach((v) {
    //     mrecords!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['gender'] = gender;
    data['weight'] = weight;
    data['height'] = height;
    data['address'] = address;
    data['meals'] = meals;
    data['phone'] = phone;
    data['image'] = image;
    // if (this.mconditions != null) {
    //   data['mconditions'] = this.mconditions!.map((v) => v.toJson()).toList();
    // }
    // if (this.mrecords != null) {
    //   data['mrecords'] = this.mrecords!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
