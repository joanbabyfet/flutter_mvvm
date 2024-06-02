import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logger.dart';
import '../config.dart';

//将 Dio 实例化和拦截器注册的操作放到单独的方法中，方便管理
Dio initDio(String _apiHost) {
  BaseOptions options = BaseOptions(
    baseUrl: _apiHost, //api地址
  );
  //Dio 实例化
  Dio dio = Dio(options);
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      getLogger().i({ //Info log
        "type": "请求数据",
        "请求数据：": options.data,
        "请求地址：": options.uri.toString(),
        "请求头：": options.headers,
        "请求方式：": options.method,
      });
      return handler.next(options);
    },
    onResponse: (response, handler) {
      getLogger().i({ //Info log
        "type": "响应数据",
        "响应数据：": response.data,
        "响应头：": response.headers,
      });
      return handler.next(response);
    },
    onError: (e, handler) {
      /// 请求出错后，关闭加载提示
      getLogger().e({ //Error log
        "type": "错误响应数据",
        "错误信息：": e.message,
        "错误类型：": e.type,
      });
      return handler.next(e);
    },
  ));
  return dio;
}

class Request {
  static final Request _singleton = Request._init(); //单例
  static Dio dio = initDio(api_url);

  factory Request() {
    return _singleton;
  }

  Request._init();

  /// get 请求
  Future<dynamic> get(
      String path, {
        Map<String, dynamic>? param, //请求传参
        Map<String, dynamic>? headers, //请求头参数
      }) async {

    final prefs = await SharedPreferences.getInstance();
    if(headers != null){
      //addAll方法为两个Map合并，类型需要一致 ，且如果key相同，则会覆盖value
      headers.addAll({"token":prefs.getString('token')});
    }else{
      headers = {"token":prefs.getString('token')};
    }

    Response response = await dio.get(
      path,
      queryParameters: param,
      options: Options(
        headers: headers,
      ),
    );
    return _handleResponse(response);
  }

  /// post 请求
  Future<dynamic> post(
      String path, {
        dynamic data, //请求参数
        Map<String, dynamic>? headers, //请求头参数
      }) async {

    final prefs = await SharedPreferences.getInstance();
    if(headers != null){
      //addAll方法为两个Map合并，类型需要一致 ，且如果key相同，则会覆盖value
      headers.addAll({"token":prefs.getString('token')});
    }else{
      headers = {"token":prefs.getString('token')};
    }

    Response response = await dio.post(
      path,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      try {
        return response.data;
      } catch (e) {
        getLogger().e({ //Error log
          "type": "错误",
          "服务端返回的数据：": response,
        });
      }
    } else {
      getLogger().e({ //Error log
        "type": "错误",
        "服务端返回的数据：": response,
      });
    }
  }
}