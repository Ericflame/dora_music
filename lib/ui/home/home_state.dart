import 'package:flutter/material.dart';
class HomeState {
  TabController? controller;
  TextEditingController searchController = TextEditingController();
  List<Tab> tabs = [
    Tab(text: "歌曲"),
    Tab(text: "推荐"),
    Tab(text: "歌手"),
    Tab(text: "小视频"),
    Tab(text: "文章"),
    Tab(text: "视频"),
  ];
}
