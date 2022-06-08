import 'package:flutter/material.dart';
import 'package:flutter_advanced/http/service.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../bean/mv_top.dart';
import '../bean/play_list.dart';
import '../bean/radio_list.dart';
import '../bean/singers_list.dart';

class HomeLogic extends GetxController with SingleGetTickerProviderMixin {
  // List<String> tabs = ["歌曲","歌曲","歌曲","歌曲","歌曲","歌曲"];
  TabController? controller;
  List<Tab> tabs = [
    Tab(text: "歌曲"),
    Tab(text: "推荐"),
    Tab(text: "歌手"),
    Tab(text: "小视频"),
    Tab(text: "文章"),
    Tab(text: "视频"),
  ];
  RxList<MvTop> topMvList = <MvTop>[].obs;
  RxList<PlayList> playList = <PlayList>[].obs;
  RxList<RadioList> radioList = <RadioList>[].obs;
  RxList<SingersList> singersList = <SingersList>[].obs;
  var selectIndex = 0.obs;
  var selectName = "".obs;
  var limit = 20.obs;
  EasyRefreshController refreshController = EasyRefreshController();
  Map<String, int> singerTypes = {
    "全部": -1,
    "男歌手": 1,
    "女歌手": 2,
    "乐队": 3,
  };

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getMvTop();
    getPlayList();
    getRadioList();
    getSingersList(limit.value,-1,-1);
  }

  //  获取Mv排名
  getMvTop() {
    Service.getSongs(3).then((value) {
      topMvList.value = value;
      // print(value[0].cover.toString());
    });
  }

  //  获取精品歌单
  getPlayList() {
    Service.getPlayList(3).then((value) {
      playList.value = value;
      // print(value[0].name.toString());
    });
  }

  //  获取电台
  getRadioList() {
    Service.getRadioList().then((value) {
      radioList.value = value;
    });
  }

  //  获取歌手
  getSingersList(int limit, int type, int area) {
    Service.getSingersList(limit, type, area).then((value) {
      singersList.value = value;
    });
  }
}
