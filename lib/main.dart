import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/config/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flustars/flustars.dart' as flustars;
import 'package:sp_util/sp_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'ui/bottom_navigationWidget.dart';
import 'ui/guidePage.dart';
import 'http/httpRequest.dart';
import 'http/http_interceptor.dart';

void main() {
  runApp(MyApp());
  //强制竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      locale: Locale('zh', 'CH'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.page,
          // textTheme: ,//文字颜色
          // splashColor: Colors.transparent,//取消水波纹效果
          // highlightColor: Colors.transparent,//取消水波纹效果
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.nav,
              // selectedItemColor: AppColors.active,
              unselectedItemColor: AppColors.unactive,
              selectedLabelStyle: TextStyle(fontSize: 12)),
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.nav,
              centerTitle: true,
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('samples');//通道名称初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initAMap();
    // 延迟进入主页
    // Future.delayed(Duration(seconds: 3), () async {
    //   Get.off(() => BottomNavigationWidget());
    // });
  }
  //高德地图初始化
  _initAMap()async{
    print("初始化map");
    await MethodChannel('samples')
        .invokeMethod('setApiKey', {"key": "83aec091225343bdcac57b1e76b61bbf"});
    await MethodChannel('samples')
        .invokeMethod('updatePrivacyStatement');
  }

  //初始化网络请求
  _initHttpRequest()async{
    HttpRequest.initConfig(
      connectTimeout: 6 * 60 * 1000,
      receiveTimeout: 6 * 60 * 1000,
      sendTimeout: 2 * 60 * 1000,
      // verifyCer: true,
      // serverCer: SSL.certfdxj,
      // proxy: "192.168.137.1:8888",
      enableHttpsProxy: true,
      // hostAndPortList: [
      //   '118.112.17.87:443',
      //   'www.tfdxj.com',
      //   'prod.tfdxj.com',
      // ],
      commonErrorCallback: (DioError error) {
        if (error.response != null && error.response!.statusCode != null && error.response!.statusCode == 401) {
          Fluttertoast.showToast(msg: "登录过期，请重新登录");
        } else if (error.type == DioErrorType.other) {
          Fluttertoast.showToast(msg: "网络不可用");
        } else if (error.type == DioErrorType.connectTimeout) {
          Fluttertoast.showToast(msg: "连接超时");
        } else {
          if (!flustars.TextUtil.isEmpty(error.response?.data["message"])) {
            Fluttertoast.showToast(msg: error.response?.data["message"]);
          }
          // Fluttertoast.showToast(msg: error.message);
        }
      },
    );
    HttpRequest.getInstance().dio.interceptors.add(HttpInterceptor());

    // HttpRequest().dio.interceptors.add(HttpInterceptor());
    // HttpRequest.getInstance().dio.interceptors.add(SignInterceptor());
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);
    return guidePage();
  }
}
