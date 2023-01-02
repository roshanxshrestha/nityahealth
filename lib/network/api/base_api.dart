import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    print("Api call ");
    options.baseUrl = "http://health.sajiloweb.com/api/";
    options.validateStatus = (status) {
      return status! < 501;
    };

    // options.baseUrl = 'https://sajilobus.herokuapp.com/api/v1';
    interceptors..add(ApiInterceptor());
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}' +
        ' data: ${options.data}');
    handler.next(options);
    // return options;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('---api-response--->resp----->${response.data}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      ResponseData respData = ResponseData.fromJson(response.data);
      response.data = respData.data;

      // return http.(response);
    } else if (response.statusCode == 401) {
      String message = response.data["error"].first["detail"];
      Exception error = NotSuccessException("Session Expired / $message");
      print("Logout user");
      throw error;
    } else {
      ResponseData respData = ResponseData.fromJson(response.data);
      Exception error = NotSuccessException.fromRespData(respData);
      throw error;
    }
    super.onResponse(response, handler);
  }
}

class ResponseData extends BaseResponseData {
  // bool get success => 200 == code;

  ResponseData.fromJson(Map<String, dynamic> json) {
    // code = json['code'];
    // print("Error is ${json['error']}");

    if (json.containsKey('message')) {
      Errors jsonerror = Errors(cause: 'Login', detail: json['message']);
      error = [jsonerror];
    }
    if (json.containsKey('error')) {
      error = json['error']
          .map<Errors>((item) => Errors.fromJsonMap(item))
          .toList();
    }

    // print("Error detail is ${error.first.detail}");
    if (json.containsKey("data")) {
      data = json['data'];
    }
    if (json.containsKey("meta")) {
      meta = json['meta'];
    }
  }
}
