import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:nityahealth/utils/pref_manager.dart';

// must be a top-level function
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    /// Initialization Add app general processing
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors.add(HeaderInterceptor()); // .. before
    init();
  }

  void init();
}

/// 添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.connectTimeout = 1000 * 30;
    options.receiveTimeout = 1000 * 30;

    // options.headers['X-Requested-With'] = 'XMLHttpRequest';
    // ignore: unrelated_type_equality_checks
    var token = await PrefManager.getToken();

    var isLogin = await PrefManager.getIsLogin();

    if (isLogin && token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $token";
    }

    options.headers['Accept'] = "application/json";
    log('Headers is ${options.headers}');
    return handler.next(options);
  }
}

/// 子类需要重写
abstract class BaseResponseData {
  List<Errors>? error;
  dynamic data;
  dynamic meta;
  // bool get success;

  BaseResponseData({this.error, this.data, this.meta});

  @override
  String toString() {
    return 'BaseRespData{errors: $error, data: $data, meta: $meta}';
  }
}

class Errors {
  String? cause;
  String? detail;
  String? code;
  String? pointer;

  Errors({this.cause, this.detail, this.code, this.pointer});

  Errors.fromJsonMap(Map<String, dynamic> map)
      : cause = map["cause"],
        detail = map["detail"],
        code = map["code"],
        pointer = map["pointer"];
}

/// 接口的code没有返回为true的异常
class NotSuccessException implements Exception {
  String? error;

  NotSuccessException(this.error);
  NotSuccessException.fromRespData(BaseResponseData respData) {
    error = respData.error?.first.detail;
  }

  @override
  String toString() {
    return 'NotExpectedException{respData: $error}';
  }
}

/// 用于未登录等权限不够,需要跳转授权页面
class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}
