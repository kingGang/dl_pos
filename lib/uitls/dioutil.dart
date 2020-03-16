import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dl_pos/uitls/refreshtoken.dart';

class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}
// const String BaseUrl ="https://care.lingo8.cn/";
const String BaseUrl = "https://pos.api.caredaily.com/";
class DioUtil {
  static final DioUtil _instance = DioUtil._init();
  static Dio _dio;
  static BaseOptions _options = getDefOptions();

  factory DioUtil() {
    
    return _instance;
  }

  DioUtil._init() {
    _dio = new Dio();
    _dio.options=getDefOptions();
    _dio.interceptors.add(RefreshTokenInterceptor());
  }

  static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    options.baseUrl=BaseUrl;
    options.connectTimeout = 10 * 1000;
    options.receiveTimeout = 20 * 1000;
    // options.contentType = ContentType.parse('application/x-www-form-urlencoded') as String;

    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/json';

    String platform;
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }
    headers['OS'] = platform;
    options.headers = headers;

    return options;
  }

  setOptions(BaseOptions options) {
    _options = options;
    _dio.options = _options;
    
  }

  void addInterceptor(Interceptor element) {
    _dio.interceptors.add(element);
  }

  void get(
      String path, void Function(dynamic data) handler,
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      void Function(int, int) onSendProgress,
      void Function(int, int) onReceiveProgress}) async {
    return request(Method.get, path, handler,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  void delete(
      String path, void Function(dynamic data) handler,
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      void Function(int, int) onSendProgress,
      void Function(int, int) onReceiveProgress}) async {
    return request(Method.delete, path, handler,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  void put(
      String path, void Function(dynamic data) handler,
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      void Function(int, int) onSendProgress,
      void Function(int, int) onReceiveProgress}) async {
    return request(Method.put, path, handler,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  void head(
      String path, void Function(dynamic data) handler,
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      void Function(int, int) onSendProgress,
      void Function(int, int) onReceiveProgress}) async {
    return request(Method.head, path, handler,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  void patch(String path, void Function(dynamic data) handler,
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      void Function(int, int) onSendProgress,
      void Function(int, int) onReceiveProgress}) async {
    return request(Method.patch, path, handler,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  void post(
      String path, void Function(dynamic data) handler,
      {dynamic data,
      Map<String, dynamic> queryParameters,
      CancelToken cancelToken,
      void Function(int, int) onSendProgress,
      void Function(int, int) onReceiveProgress}) {
    return request(Method.post, path, handler,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  request(String method, String path, void Function(dynamic data) handler,
      {dynamic data,
      Map<String, dynamic> queryParameters,
      CancelToken cancelToken,
      Options options,
      void Function(int, int) onSendProgress,
      void Function(int, int) onReceiveProgress}) async {
    try {
      Response resp = await _dio.request(path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      if (handler != null) {
        handler(resp.data);
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  ///处理Http错误码
  void _handleHttpError(int errorCode) {}
}
