import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import '../../bean/hot_search.dart';
import '../../bean/search_suggest_list.dart';

/// File Name: search_page_state
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-16
/// Copy Right ©2023-03-16 flutter_test All Right Reserved
class SearchState {
  TabController? controller;
  var hotSearchDetail = <HotSearch>[].obs;
  var searchSuggestList = <SearchSuggestList>[].obs;
  double distance = ScreenUtil().screenHeight * 0.25;

  List<Tab> tabs = [
    Tab(text: "综合"),
    Tab(text: "单曲"),
    Tab(text: "视频"),
    Tab(text: "歌手"),
    Tab(text: "专辑"),
    Tab(text: "歌单"),
    Tab(text: "主播电台"),
    Tab(text: "用户"),
  ];
}