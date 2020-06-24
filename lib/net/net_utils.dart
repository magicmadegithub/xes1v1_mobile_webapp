import 'package:dio/dio.dart';

import 'net_url.dart';
import 'package:xes1v1mobileweb/generated/json/base/json_convert_content.dart';

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
  Future<T> _request<T>(
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

    T _data = JsonConvert.fromJsonAsT(response.data);
    return _data;
  }

  Future<T> request<T>(
    String method,
    String url, {
    Map<String, dynamic> params,
  }) async {
    var response = await _request<T>(method, url, params: params);
    return response;
  }

  Future get<T>(String url,
      {Function(T t) onData, Map<String, dynamic> params}) {
    return request<T>('GET', url, params: params).then((result) {
      if (onData != null) {
        onData(result);
      }
    });
  }

  Future post<T>(String url,
      {Function(T t) onData, Map<String, dynamic> params}) {
    return request<T>('POST', url, params: params).then((result) {
      if (onData != null) {
        onData(result);
      }
    });
  }
}
