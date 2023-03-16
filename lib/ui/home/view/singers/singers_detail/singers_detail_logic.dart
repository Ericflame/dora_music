import 'package:flutter/material.dart';
import 'package:flutter_advanced/bean/mvs.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../../../../../bean/hot_song.dart';
import '../../../../../bean/singer_details.dart';
import '../../../../../bean/singer_hot_album.dart';
import '../../../../../bean/singers_details.dart';
import '../../../../../http/service.dart';

class Singers_detailLogic extends GetxController with SingleGetTickerProviderMixin {
  var artistId = 0.obs;
  Rx<SingersDetails> singersDetails = new SingersDetails().obs;
  RxList<SingerDetails> singerDetailsList = <SingerDetails>[].obs;
  RxList<HotSong> singerHotSongs = <HotSong>[].obs;
  RxList<SingerHotAlbum> singerAlbums = <SingerHotAlbum>[].obs;
  RxList<Mvs> singerMvs = <Mvs>[].obs;
  TabController? controller;
  EasyRefreshController refreshController = EasyRefreshController();
  List<Tab> tabs = [
    Tab(text: "主页"),
    Tab(text: "专辑"),
    Tab(text: "歌曲"),
    Tab(text: "视频"),
  ];
  var limit = 10.obs;
  var index = 0.obs;

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
    artistId.value = Get.arguments["artistId"];
    getSingerHotSongs();
    getSingerDetails();
    getSingerAlbum();
    getSingerMv();
  }

  //  获取歌手详细信息
  getSingerHotSongs() {
    Map<String, dynamic> param = {'id': artistId.value};
    EasyLoading.show();
    Service.getSingersDetails(param).then((value) {
      if (value != null) {
        singersDetails.value = SingersDetails.fromJson(value.artist);
        singerHotSongs.value = value.hotSongs!;
        EasyLoading.dismiss();
      }
    });
  }

  getSingerDetails() {
    Map<String, dynamic> param = {'id': artistId.value};
    EasyLoading.show();
    Service.getSingerDetails(param).then((value) {
      if (value != null) {
        singerDetailsList.value = value;
        EasyLoading.dismiss();
      }
    });
  }

  //  获取歌手专辑
  getSingerAlbum() {
    Map<String, dynamic> param = {'id': artistId.value, "limit": limit.value};
    EasyLoading.show();
    Service.getSingerAlbum(param).then((value) {
      if (value != null) {
        singerAlbums.value = value;
        EasyLoading.dismiss();
      }
    });
  }

  //  获取歌手Mv
  getSingerMv() {
    Map<String, dynamic> param = {'id': artistId.value};
    EasyLoading.show();
    Service.getSingerMv(param).then((value) {
      if (value != null) {
        singerMvs.value = value;
        EasyLoading.dismiss();
      }
    });
  }
}
