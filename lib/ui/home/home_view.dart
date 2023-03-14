import 'package:flutter/material.dart';
import 'package:flutter_advanced/config/app_colors.dart';
import 'package:flutter_advanced/ui/home/view/explore/explore_view.dart';
import 'package:flutter_advanced/ui/home/view/music_cloud/music_cloud_view.dart';
import 'package:flutter_advanced/ui/home/view/singers/singers_view.dart';
import 'package:get/get.dart';
import 'view/widget/search_view.dart';
import 'view/songs/songs_view.dart';
import 'home_logic.dart';
import 'home_state.dart';

/// Controller


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 获取逻辑层
  final logic = Get.put(HomeLogic());
  HomeState state = HomeState();

  @override
  Widget build(BuildContext context) {
    return Container(child: Scaffold(
      appBar: AppBar(
        title: searchView(),
        bottom:
        TabBar(
          // indicatorColor: AppColors.unactive,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          tabs: state.tabs,
          controller: logic.state.controller,
        ),
      ),
      body: TabBarView(
        controller: logic.state.controller,
        children: [
          /// 展示View层
          SongsView(),
          ExploreView(),
          SingersView(),
          MusicCloudPage(),
          // Text("云村"),
          Text("视频"),
          Text("我的"),

        ],
      ),
    ),);
  }
}

