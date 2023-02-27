import 'package:flutter/material.dart';
import 'package:flutter_advanced/config/app_colors.dart';
import 'package:flutter_advanced/ui/home/widget/explore_view.dart';
import 'package:flutter_advanced/ui/home/widget/music_cloud.dart';
import 'package:flutter_advanced/ui/home/widget/search_view.dart';
import 'package:flutter_advanced/ui/home/widget/singers.dart';
import 'package:flutter_advanced/ui/home/widget/songs.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomeLogic());

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
          tabs: logic.tabs,
          controller: logic.controller,
        ),
      ),
      body: TabBarView(
        controller: logic.controller,
        children: [
          SongsView(),
          ExploreView(),
          SingersView(),
          MusicCloud(),
          // Text("云村"),
          Text("视频"),
          Text("我的"),
        ],
      ),
    ),);
  }
}

