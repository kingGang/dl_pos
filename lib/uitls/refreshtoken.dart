import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends Interceptor{
  @override
  Future onRequest(RequestOptions options) {
    if (options.headers["Authorization"]==null){
      // print("未设置token");
      return super.onError(DioError(error: "未设置token"));
    }
    // TODO: implement onRequest
    return super.onRequest(options);
  }
  @override
  Future onError(DioError err) {
    // TODO: implement onError
    if (err.response!=null&&err.response.statusCode==401){
      print("token过期,重新登录");
      
    }
    return super.onError(err);
  }
}

