import 'dart:io';
import 'package:flutter/services.dart';

class AppUtil {
  static String getCompileMode() {
    const bool isProfile = const bool.fromEnvironment("dart.vm.profile");
    const bool isReleaseMode = const bool.fromEnvironment("dart.vm.product");
    if (isDebug()) {
      return "debug";
    } else if (isProfile) {
      return "profile";
    } else if (isReleaseMode) {
      return "release";
    } else {
      return "Unknown type";
    }
  }

  /// 判断是否为Debug模式
  static bool isDebug() {
    bool inDebug = false;
    assert(inDebug = true);
    return inDebug;
  }

  // ///获取当前app的apk安装包md5值
  // static Future<String> getAppMd5() async{
  //   if (Platform.isAndroid) {
  //     MethodChannel _channel = MethodChannel(ChannelMethod.CHANNEL_NAME);
  //     String apkMd5 = await _channel.invokeMethod(ChannelMethod.APP_MD5);
  //     return apkMd5;
  //   }
  //   return "";
  // }
  //
  // ///获取app的签名
  // static Future<String> getAppSignatureMd5() async{
  //   if (Platform.isAndroid) {
  //     MethodChannel _channel = MethodChannel(ChannelMethod.CHANNEL_NAME);
  //     String signatureMd5 = await _channel.invokeMethod(ChannelMethod.GET_APP_SIGNATURE_MD5);
  //     return signatureMd5;
  //   }
  //   return "";
  // }
}
