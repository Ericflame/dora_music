import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class E3Classical {
  static getHeader() {
    //BallPulseHeader
    String time = DateUtil.formatDate(DateTime.now(), format: DateFormats.h_m);
    return ClassicalHeader(
      refreshText: "下拉可以刷新",
      refreshReadyText: "释放立即刷新",
      refreshingText: "正在刷新...",
      refreshedText: "刷新完成",
      refreshFailedText: "刷新失败",
      noMoreText: "没有更多啦",
      infoText: "上次更新" + time,
      textColor: Colors.black54,
      infoColor: Colors.black54,
    );
  }

  static getFooter() {
    String time = DateUtil.formatDate(DateTime.now(), format: DateFormats.h_m);
    return ClassicalFooter(
      loadText: "上拉加载更多",
      loadReadyText: "释放立即加载",
      loadingText: "正在加载...",
      loadedText: "加载完成",
      noMoreText: "我是有底线的",
      loadFailedText: "加载失败",
      infoText: "上次加载" + time,
      textColor: Colors.black54,
      infoColor: Colors.black54,
    );
  }
}
