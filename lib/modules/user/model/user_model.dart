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
  String? image;
  String? name;
  String? email;
  String? age;
  String? gender;
  String? address;
  String? phone;
  String? weight;
  String? height;
  String? bloodGrp;
  String? meals;
  List<MedicalConditions>? medicalConditions;
  List<MdicalRecords>? mdicalRecords;

  User(
      {this.id,
      this.image,
      this.name,
      this.email,
      this.age,
      this.gender,
      this.address,
      this.phone,
      this.weight,
      this.height,
      this.bloodGrp,
      this.meals,
      this.medicalConditions,
      this.mdicalRecords});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    gender = json['gender'];
    address = json['address'];
    phone = json['phone'];
    weight = json['weight'];
    height = json['height'];
    bloodGrp = json['blood_grp'];
    meals = json['meals'];
    if (json['Medical conditions'] != null) {
      medicalConditions = <MedicalConditions>[];
      json['Medical conditions'].forEach((v) {
        medicalConditions!.add(MedicalConditions.fromJson(v));
      });
    }
    if (json['Mdical records'] != null) {
      mdicalRecords = <MdicalRecords>[];
      json['Mdical records'].forEach((v) {
        mdicalRecords!.add(MdicalRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['gender'] = gender;
    data['address'] = address;
    data['phone'] = phone;
    data['weight'] = weight;
    data['height'] = height;
    data['blood_grp'] = bloodGrp;
    data['meals'] = meals;
    if (medicalConditions != null) {
      data['Medical conditions'] =
          medicalConditions!.map((v) => v.toJson()).toList();
    }
    if (mdicalRecords != null) {
      data['Mdical records'] = mdicalRecords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MedicalConditions {
  int? id;
  String? diseaseName;
  String? type;
  String? isCured;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  MedicalConditions(
      {this.id,
      this.diseaseName,
      this.type,
      this.isCured,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  MedicalConditions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    diseaseName = json['disease_name'];
    type = json['type'];
    isCured = json['is_cured'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['disease_name'] = diseaseName;
    data['type'] = type;
    data['is_cured'] = isCured;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? mconditionId;

  Pivot({this.userId, this.mconditionId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mconditionId = json['mcondition_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['mcondition_id'] = mconditionId;
    return data;
  }
}

class MdicalRecords {
  int? id;
  String? medicineName;
  int? diseaseId;
  String? duration;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  MdicalRecords(
      {this.id,
      this.medicineName,
      this.diseaseId,
      this.duration,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  MdicalRecords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicineName = json['medicine_name'];
    diseaseId = json['disease_id'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medicine_name'] = medicineName;
    data['disease_id'] = diseaseId;
    data['duration'] = duration;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}
