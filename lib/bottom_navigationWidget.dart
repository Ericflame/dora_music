import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:flutter_advanced/profile/profile_view.dart';
import 'package:flutter_advanced/video/video_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';

import 'add_media/add_media_view.dart';
import 'home/home_view.dart';
import 'music/music_view.dart';

bool showFileUploadingOverlay = false;

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> with WidgetsBindingObserver {
  int currentIndex = 0;
  final List<BottomNavigationBarItem> bottomNavbarItems = [];
  Map<String, String> itemNames = {"home": "首页", "music": "音乐", "add": "添加", "message": "小视频", "mine": "个人中心"};
  final List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    itemNames.forEach((key, value) {
      bottomNavbarItems.add(bottomNavbarItem(key));
    });
    pages..add(HomePage())..add(MusicPage())..add(Add_mediaPage())..add(VideoPage())..add(ProfilePage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: pages,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavbarItems,
        currentIndex: currentIndex,
        onTap: onTabClick,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  onTabClick(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  BottomNavigationBarItem bottomNavbarItem(String value) {
    return value == "add"
        ? BottomNavigationBarItem(
            icon: Image.asset(
              Assets.imagesIconAdd,
              width: 40,
              height: 40,
            ),
            activeIcon: Image.asset(
              Assets.imagesIconAdd1,
              width: 40,
              height: 40,
            ),
            label: "")
        : BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/icon_${value}.png",
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              "assets/images/icon_${value}1.png",
              width: 24,
              height: 24,
            ),
            label: value);
  }
}
