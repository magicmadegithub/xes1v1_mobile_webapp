import 'package:dio/dio.dart';

import 'net_url.dart';

class NetUtils {
  static final NetUtils _singleton = NetUtils._internal();

  static NetUtils get instance => NetUtils();

  factory NetUtils() {
    return _singleton;
  }

  static Dio _dio;

  Dio getDio() {
    return _dio;
  }

  NetUtils._internal() {
    var options = BaseOptions(
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      responseType: ResponseType.json,
      baseUrl: NetUrl.host,
    );

    _dio = Dio(options);
    _dio.options.baseUrl = NetUrl.host;

    /// 打印Log
    _dio.interceptors
        .add(LogInterceptor(requestBody: false, responseBody: false));
  }

  /// 调用dio进行网络请求
  Future<Map<String, dynamic>> _request(
    String method,
    String url, {
    Map<String, dynamic> params,
  }) async {
    Response response;
    switch (method) {
      case "GET":
        response = await _dio.get(url, queryParameters: params);
        break;
      case "POST":
        response = await _dio.post(url, data: params);
        break;
    }

    Map<String, dynamic> _result = response.data;
    return _result;
  }

  Future<Map<String, dynamic>> request(
    String method,
    String url, {
    Map<String, dynamic> params,
  }) async {
    var response = await _request(method, url, params: params);
    return response;
  }

  Future get(String url,
      {Function(Map<String, dynamic> result) onData,
      Map<String, dynamic> params}) {
    return request('GET', url, params: params).then((result) {
      if (onData != null) {
        onData(result);
      }
    });
  }

  Future post(String url,
      {Function(Map<String, dynamic> result) onData,
      Map<String, dynamic> params}) {
    return request('POST', url, params: params).then((result) {
      if (onData != null) {
        onData(result);
      }
    });
  }
}
