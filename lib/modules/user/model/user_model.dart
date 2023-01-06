class UserModel {
  User? user;

  UserModel({this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? age;
  Null? gender;
  Null? weight;
  Null? height;
  Null? address;
  Null? meals;
  Null? phone;
  Null? image;
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['address'] = this.address;
    data['meals'] = this.meals;
    data['phone'] = this.phone;
    data['image'] = this.image;
    // if (this.mconditions != null) {
    //   data['mconditions'] = this.mconditions!.map((v) => v.toJson()).toList();
    // }
    // if (this.mrecords != null) {
    //   data['mrecords'] = this.mrecords!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
