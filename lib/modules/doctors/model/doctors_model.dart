class DoctorsModel {
  bool? success;
  Data? data;
  String? message;

  DoctorsModel({this.success, this.data, this.message});

  DoctorsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  List<Doctors>? doctors;

  Data({this.doctors});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctors != null) {
      data['doctors'] = doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  int? id;
  String? name;
  String? email;
  String? position;
  String? phone;
  String? experince;
  String? qualificaton;
  String? speciality;
  String? nMCNumber;
  String? website;
  String? image;

  Doctors(
      {this.id,
      this.name,
      this.email,
      this.position,
      this.phone,
      this.experince,
      this.qualificaton,
      this.speciality,
      this.nMCNumber,
      this.website,
      this.image});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    position = json['position'];
    phone = json['phone'];
    experince = json['experince'];
    qualificaton = json['Qualificaton'];
    speciality = json['speciality'];
    nMCNumber = json['NMC_number'];
    website = json['website'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['position'] = position;
    data['phone'] = phone;
    data['experince'] = experince;
    data['Qualificaton'] = qualificaton;
    data['speciality'] = speciality;
    data['NMC_number'] = nMCNumber;
    data['website'] = website;
    data['image'] = image;
    return data;
  }
}
