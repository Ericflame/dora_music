import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flustars/flustars.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dio_logger.dart';
import '../utils/app_util.dart';

// http 请求单例类
class HttpRequest {
  // factory HttpRequest() => _instance; // 工厂构造方法
  // static final HttpRequest _instance = HttpRequest._internal(); // 初始化一个单例实例
  // HttpRequest._internal() {
  //   if (dio == null) {
  //     // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
  //     BaseOptions baseOptions = BaseOptions(
  //       baseUrl: HttpOptions.BASE_URL,
  //       connectTimeout: HttpOptions.CONNECT_TIMEOUT,
  //       receiveTimeout: HttpOptions.RECEIVE_TIMEOUT,
  //       headers: {},
  //     );
  //     // 没有实例 则创建之
  //     dio = new Dio(baseOptions);
  //     // 添加拦截器
  //     dio.interceptors.add(HttpInterceptor());
  //   }
  // } // 内部构造方法

  static HttpRequest? _instance; //构造方法实例
  Dio dio = new Dio(); // dio 实例
  static bool _showErrorToast = false;
  static Function? _commonErrorCallback; //全局配置错误处理
  static bool isDebug = true;
  CancelToken _cancelToken = new CancelToken();
  static String? _proxy; //抓包代理
  static bool _verifyCer = false; //是否开启证书校验
  static bool _enableHttpsProxy = false; //是否允许https抓包,mProxy不为空且mVerifyCer为false时才有效
  static List<String>? _hostAndPortList; //"${主机}:{端口}",用于抓包校验
  static String? _serverCer; //https服务端证书内容
  static int _connectTimeout = 60 * 1000;
  static int _receiveTimeout = 60 * 1000;
  static int _sendTimeout = 60 * 1000;
  static List<InterceptorsWrapper>? _interceptors;
  static String? _baseUrl;
  static bool _parmaSign = false;
  static bool _preventRepeatRequest = false;
  static String? _headerHost;
  static String? _headerReferer;

  /// 获取构造方法实例
  static HttpRequest getInstance() {
    if (_instance == null) {
      _instance = HttpRequest();
    }
    return _instance!;
  }

  // static HttpRequest getNewInstance(
  //     {int? receiveTimeout = 60 * 1000,
  //       int? connectTimeout = 60 * 1000,
  //       int? sendTimeout = 60 * 1000,
  //       List<InterceptorsWrapper>? interceptors}) {
  //   return HttpRequest(receiveTimeout: receiveTimeout, connectTimeout: connectTimeout, interceptors: interceptors);
  // }

  /// 构造方法
  HttpRequest({int? receiveTimeout, int? connectTimeout, int? sendTimeout, List<InterceptorsWrapper>? interceptors}) {
    isDebug = AppUtil.isDebug(); //是否是debug模式
    dio = new Dio();
    dio.options.connectTimeout = receiveTimeout ?? _connectTimeout;
    dio.options.receiveTimeout = connectTimeout ?? _receiveTimeout;
    dio.options.sendTimeout = sendTimeout ?? _sendTimeout;
    if (_baseUrl != null) {
      dio.options.baseUrl = _baseUrl!;
    }
    //抓包设置
    if (!TextUtil.isEmpty(_proxy)) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        //解决安卓https抓包的问题
        if (_enableHttpsProxy) {
          client.badCertificateCallback = (X509Certificate cert, String host, int port) {
            return true;
          };
        }
        client.findProxy = (uri) {
          return "PROXY " + _proxy!;
        };
      };
    } else {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        SecurityContext sc = SecurityContext.defaultContext;
        HttpClient httpClient = HttpClient(context: sc);
        //域名模式不走这里，只有ip会走
        httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
          if (_verifyCer && Platform.isAndroid) {
            if (_serverCer == null) {
              return false;
            }
            String hostAndPort = host;
            if (port > 0) {
              hostAndPort = host + ":" + port.toString();
            }
            return cert.pem == _serverCer && _hostAndPortList != null && _hostAndPortList!.contains(hostAndPort);
          } else {
            return true;
          }
        };
        return httpClient;
      };
    }
    /// 增加拦截器 (接口请求前数据处理:onRequest;接口成功返回时处理:onResponse;接口报错时处理:onError)
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('send request：path:${options.path}，baseURL:${options.baseUrl}');
      return handler.next(options);
    }));
    /// 是否开启请求日志
    dio.interceptors.add(LogInterceptor(responseBody: true));

    /// 签名拦截器
    // dio.interceptors.add(SignInterceptor(
    //     parmaSign: _parmaSign,
    //     preventRepeatRequest: _preventRepeatRequest,
    //     headerHost: _headerHost,
    //     headerReferer: _headerReferer));
    if (interceptors != null) {
      for (InterceptorsWrapper interceptorsWrapper in _interceptors!) {
        dio.interceptors.add(interceptorsWrapper);
      }
    } else if (_interceptors != null) {
      for (InterceptorsWrapper interceptorsWrapper in _interceptors!) {
        dio.interceptors.add(interceptorsWrapper);
      }
    }
    /// 缓存插件
    // dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: _baseUrl)).interceptor);
    if (isDebug) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }

  //初始化配置
  static initConfig(
      {String? baseUrl,
      bool verifyCer = false,
      bool enableHttpsProxy = false,
      int receiveTimeout = 60 * 1000,
      int connectTimeout = 60 * 1000,
      int sendTimeout = 60 * 1000,
      bool showErrorToast = false,
      String? proxy,
      String? serverCer,
      List<String>? hostAndPortList,
      List<InterceptorsWrapper>? interceptors,
      bool parmaSign = false,
      bool preventRepeatRequest = false,
      String? headerHost,
      String? headerReferer,
      Function? invalidCallback,
      Function? commonErrorCallback}) {
    _verifyCer = verifyCer;
    _enableHttpsProxy = enableHttpsProxy;
    _receiveTimeout = receiveTimeout;
    _connectTimeout = connectTimeout;
    _sendTimeout = sendTimeout;
    _proxy = proxy;
    _serverCer = serverCer;
    _hostAndPortList = hostAndPortList;
    _interceptors = interceptors;
    _showErrorToast = showErrorToast;
    _commonErrorCallback = commonErrorCallback;
    _baseUrl = baseUrl;
    _parmaSign = parmaSign;
    _preventRepeatRequest = preventRepeatRequest;
    _headerHost = headerHost;
    _headerReferer = headerReferer;
  }

  /// 取消请求
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  /// 设置鉴权请求头
  Options setAuthorizationHeader(Options requestOptions) {
    String? _token;
    if (_token != null) {
      requestOptions.headers!['token'] = _token;
    }
    return requestOptions;
  }

  /// restful get 操作
  Future futureGet(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    Function? errorCallBack,
  }) async {
    // Options requestOptions = setAuthorizationHeader(options ?? Options());
    try {
      try {
        Response response = await dio.get(path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress);
        return response.data;
      } on DioError catch (error) {
        _error(errorCallBack, error);
        return null;
      }
    } on DioError catch (e) {
      return e.error;
    }
  }

  /// restful post 操作
  Future futurePost(
    String path, {
    Map<String, dynamic>? queryParameters, //拼接方式传参
    dynamic data, //请求头传参
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Function? errorCallBack,
  }) async {
    // Options requestOptions = setAuthorizationHeader(options ?? Options());
    try {
      Response response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioError catch (error) {
      _error(errorCallBack, error);
      return null;
    }
  }

  /// restful put 操作
  Future futurePut(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Function? errorCallBack,
  }) async {
    Response response;
    try {
      response = await dio.put(path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onReceiveProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioError catch (error) {
      _error(errorCallBack, error);
      return null;
    }
  }

  /// restful delete 操作
  Future futureDeleted(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Function? errorCallBack,
  }) async {
    Response response;
    try {
      try {
        response = await dio.delete(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
        return response.data;
      } on DioError catch (error) {
        _error(errorCallBack, error);
        return null;
      }
    } on DioError catch (e) {
      return e.error;
    }
  }

  /// restful download 操作
  Future futureDownload(
    String urlPath,
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    data,
    Options? options,
    Function? errorCallBack,
  }) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          queryParameters: queryParameters,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioError catch (e) {
      _error(errorCallBack, e);
      return null;
    }
  }

  /// 请求错误的回调
  _error(Function? errorCallBack, DioError error) {
    if (_commonErrorCallback != null) {
      _commonErrorCallback!(error);
    }
    if (errorCallBack != null) {
      errorCallBack(error);
    }
    String errorStr = error.message;
    if (error.type == DioErrorType.other) {
      errorStr = "网络不可用";
    } else if (error.type == DioErrorType.connectTimeout) {
      errorStr = "连接超时";
    }
    if (_showErrorToast) {
      Fluttertoast.showToast(msg: errorStr);
    }
  }

  /// 断点下载大文件
  Future<void> downloadRange({
    required String url,
    required String savePath,
    ProgressCallback? onReceiveProgress,
    void Function()? done,
    void Function(String)? failed,
    int totalLength = 0,
    CancelToken? cancelToken,
  }) async {
    String lastModifiedSpKey = "$savePath-LastModified";
    String fileSizeSpKey = "$url-fileSize";
    int downloadStart = 0;
    File f = File(savePath);
    if (await f.exists()) {
      downloadStart = f.lengthSync();
      //已下载的文件大小与服务器文件大小一致，则不用下载
      int fileSize = SpUtil.getInt(fileSizeSpKey) ?? 0;
      if (fileSize == downloadStart) {
        done?.call();
        return;
      }
    }
    if (cancelToken == null) {
      cancelToken = CancelToken();
    }
    String lastModified = SpUtil.getString(lastModifiedSpKey) ?? "";
    try {
      var response = await dio.get<ResponseBody>(
        url,
        options: Options(
          /// 以流的方式接收响应数据
          responseType: ResponseType.stream,
          followRedirects: false,
          headers: {
            /// 分段下载重点位置
            "range": "bytes=$downloadStart-",
            "If-Range": "$lastModified"
          },
        ),
      );
      SpUtil.putString(lastModifiedSpKey, response.headers["Last-Modified"]?.first ?? "");
      File file = File(savePath);
      RandomAccessFile raf = file.openSync(mode: FileMode.append);
      int received = downloadStart;
      // 接口返回的header里面偶现获取不到contentLength
      int total = await _getContentLength(response);
      print("下载文件的大小=$total");
      if (total == 0) {
        total = totalLength;
      }
      SpUtil.putInt(fileSizeSpKey, total);
      Stream<Uint8List> stream = response.data!.stream;
      StreamSubscription<Uint8List>? subscription;
      subscription = stream.listen(
        (data) {
          /// 写入文件必须同步
          raf.writeFromSync(data);
          received += data.length;
          onReceiveProgress?.call(received, total);
        },
        onDone: () async {
          await raf.close();
          done?.call();
        },
        onError: (e) async {
          await raf.close();
          failed?.call("下载失败");
        },
        cancelOnError: true,
      );
      cancelToken.whenCancel.then((_) async {
        await subscription?.cancel();
        await raf.close();
        failed?.call("下载取消");
      });
    } on DioError catch (error) {
      /// 请求已发出，服务器用状态代码响应它不在200的范围内
      if (CancelToken.isCancel(error)) {
        failed?.call("下载取消");
      } else {
        if (error.type == DioErrorType.other) {
          failed?.call("网络不可用");
        } else if (error.type == DioErrorType.connectTimeout) {
          failed?.call("连接超时");
        } else {
          failed?.call("下载失败");
        }
      }
      // downloadingUrls.remove(url);
    }
  }

  /// 获取下载的文件大小
  Future<int> _getContentLength(Response<ResponseBody> response) async {
    try {
      if (response.statusCode == 206) {
        var headerContent = response.headers.value(HttpHeaders.contentRangeHeader);
        if (headerContent != null) {
          return int.parse(headerContent.split('/').last);
        } else {
          return 0;
        }
      } else if (response.statusCode == 200) {
        var headerContent = response.headers.value(HttpHeaders.contentLengthHeader);
        if (headerContent != null) {
          return int.parse(headerContent);
        } else {
          return 0;
        }
      }
    } catch (e) {
      print(e);
    }
    return 0;
  }

  /// 旧版本请求
  ///
  _requstHttp(String url, Function successCallBack,
      [String? method, dynamic? params, Function? errorCallBack, bool checkHost = false]) async {
    Response? response;
    try {
      if (method == 'get') {
        if (params != null) {
          response = await dio.get(url, queryParameters: Map.fromEntries(params.fields));
        } else {
          response = await dio.get(url);
        }
      } else if (method == 'post') {
        if (params != null) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }
    } on DioError catch (error) {
      if (isDebug) {
        print('请求异常: ' + error.toString());
      }
      _error(errorCallBack, error);
      return '';
    }
    String dataStr = json.encode(response!.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    successCallBack(dataMap);
  }

  //get请求
  @Deprecated("use 'futureGet()' method instead")
  get(String url, FormData params, Function successCallBack, Function errorCallBack) async {
    _requstHttp(url, successCallBack, 'get', params, errorCallBack);
  }

  //post请求
  @Deprecated("use 'futurePost()' method instead ")
  post(String url, params, Function successCallBack, Function errorCallBack, {bool checkHost = false}) async {
    _requstHttp(url, successCallBack, "post", params, errorCallBack, checkHost);
  }

  // post请求
  @Deprecated("use 'futurePost()' method instead")
  postNoParams(String url, Function successCallBack, Function errorCallBack) async {
    _requstHttp(url, successCallBack, "post", null, errorCallBack);
  }

  download(
    String url,
    String savePath,
    Function progressCallBack,
    Function errorCallBack,
    Function noTotalCallBack, {
    data,
  }) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        Response response = await dio.download(url, savePath, data: data, onReceiveProgress: (received, total) {
          print("received====${received}");
          print("total====${total}");
          if (total != -1) {
            ///当前下载的百分比例
            progressCallBack(received / total);
          } else {
            noTotalCallBack(received);
          }
        });
      } on DioError catch (error) {
        // 请求错误处理
        Response? errorResponse;
        if (error.response != null) {
          errorResponse = error.response;
        }
        // else {
        //   errorResponse = new Response(statusCode: 201,  requestOptions: dio.options);
        // }
        // debug模式才打印
        if (isDebug) {
          print('请求异常: ' + error.toString());
        }
        _error(errorCallBack, error);
        return '';
      }
    } else {
      if (isDebug) {
        print("存储权限申请不通过");
      }
      errorCallBack("存储权限申请不通过");
    }
  }
}

Future request(url, {formData}) async {
  Response response;
  Dio dio = new Dio();
  dio.options.contentType = ContentType.parse("application/json;charset=UTF-8").toString();
  if (formData == null) {
    response = await dio.post(url);
  } else {
    response = await dio.post(url, data: formData);
  }

  /// 打印请求相关信息：请求地址、请求方式、请求参数
  print('请求地址：【' + '  ' + url + '】');
  print('请求参数：' + formData.toString());
  dio.interceptors.add(LogInterceptor(responseBody: true)); //是否开启请求日志

  // print('登录接口的返回值:'+response.data);

  if (response.statusCode == 200) {
    print('响应数据：' + response.toString());
    /*  var  obj=new Map<String, dynamic>.from(response.data);
        int code=obj['status'];
        String msg=obj['msg'];
        if (code== 200) {
           Object data=obj['data'];
           return data;
        }else{
          ToastUtil.show(msg);
        }*/
    return response.data;
  } else {
    print('后端接口出现异常：');

    throw Exception('后端接口出现异常');
  }
}
