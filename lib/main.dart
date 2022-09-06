import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/config/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_navigationWidget.dart';
import 'guidePage.dart';

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

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);
    return guidePage();
    // Scaffold(
    //   body: Stack(
    //     children: [
    //       Image.asset(
    //         "assets/images/splash_bg.png",
    //         fit: BoxFit.fill,
    //         width: double.infinity,
    //         height: double.infinity,
    //       ),
    //     ],
    //   ));
  }
}
