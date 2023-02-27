import 'package:flutter/material.dart';
import 'package:flutter_advanced/bean/mvs.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../../../../bean/hot_song.dart';
import '../../../../bean/singer_details.dart';
import '../../../../bean/singer_hot_album.dart';
import '../../../../bean/singers_details.dart';
import '../../../../http/service.dart';

class Singers_detailLogic extends GetxController with SingleGetTickerProviderMixin{
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
    getSingersDetails(artistId.value);
    getSingerDetails(artistId.value);
    getSingerAlbum(artistId.value,limit.value);
    getSingerMv(artistId.value);
  }
  //  获取歌手详细信息
  getSingersDetails(int id) {
    Service.getSingersDetails(id).then((value) {
      if (value != null) {
        singersDetails.value = SingersDetails.fromJson(value.artist);
        singerHotSongs.value = value.hotSongs;
      }
    });
  }

  getSingerDetails(int id){
    Service.getSingerDetails(id).then((value) {
      if (value != null) {
        singerDetailsList.value = value;
      }
    });
  }

  //  获取歌手专辑
  getSingerAlbum(int id,int limit){
    Service.getSingerAlbum(id,limit).then((value) {
      if (value != null) {
        singerAlbums.value = value;
      }
    });
  }

  //  获取歌手Mv
  getSingerMv(int id){
    Service.getSingerMv(id).then((value) {
      if (value != null) {
        singerMvs.value = value;
      }
    });
  }

}
