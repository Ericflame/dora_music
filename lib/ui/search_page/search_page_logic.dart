import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dora_music/ui/search_page/search_page_state.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../bean/search_suggest_list.dart';
import '../../http/service.dart';

class SearchPageLogic extends GetxController with GetSingleTickerProviderStateMixin{
  SearchState state = SearchState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.controller = TabController(length: state.tabs.length, vsync: this);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getSingerMv();
  }

  //  获取歌手Mv
  getSingerMv() {
    Map<String, dynamic> param = {};
    EasyLoading.show();
    Service.getHotSearch(param).then((value) {
      if (value != null) {
        state.hotSearchDetail.value = value;
        EasyLoading.dismiss();
      }
    });
  }
  //  获取搜索推荐 Future关键字 处理异步任务,否则无法实时更新UI
  Future<List<SearchSuggestList>> getSearchSuggest(String e) async{
    Map<String, dynamic> param = {
      "type":"mobile",
      "keywords":e
    };
    // EasyLoading.show();
    return await Service.getSearchSuggest(param);
  }

  // 获取搜索结果（单曲）
  // Future getSearchDetail(String keywords) async{
  //   ///type:1 单曲
  //   ///type:1014 视频
  //   ///type:100 歌手
  //   ///type:10 专辑
  //   ///type:1000 歌单
  //   ///type:1009 主播电台
  //   ///type:1002 用户
  //   Map<String, dynamic> param = {
  //     "keywords":keywords,
  //     "type": 1
  //   };
  //   EasyLoading.show();
  //   Service.getSearchDetail(param).then((value) {
  //     if (value != null) {
  //       EasyLoading.dismiss();
  //     }
  //   });
  // }
}
