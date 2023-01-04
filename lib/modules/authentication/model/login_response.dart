import 'dart:convert';

import 'package:nityahealth/network/api/api.dart';

import '../../../network/api/base_api.dart';

class LoginResponseModel {
  Data? data;
  String? message;
  bool? success;

  LoginResponseModel({this.data, this.message, this.success});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
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

  Data({this.name, this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['token'] = token;
    return data;
  }
}
