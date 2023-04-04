import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dora_music/generated/assets.dart';
import 'package:dora_music/ui/music/music_view.dart';
import 'package:dora_music/ui/profile/profile_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'add_media/add_media_view.dart';
import 'home/home_view.dart';
import 'message/message_view.dart';
import 'music/music_view.dart';
import 'music/widget/car_video_page.dart';

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
  Timer? logoutTimer;
  DateTime? lastTime;

  @override
  void initState() {
    super.initState();
    itemNames.forEach((key, value) {
      bottomNavbarItems.add(bottomNavbarItem(key));
    });
    pages
      ..add(HomePage())
      ..add(CarVideoPage())
      ..add(Add_mediaPage())
      ..add(MessagePage())
      ..add(ProfilePage());
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
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
      ),
      onWillPop: () async {
        // 点击返回键的操作
        if (lastTime == null || DateTime.now().difference(lastTime!) > Duration(seconds: 2)) {
          lastTime = DateTime.now();
          Fluttertoast.showToast(msg: "再按一次退出APP");
          return false;
        } else {
          lastTime = DateTime.now();
          // 退出app
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else {
            exit(0);
          }
          return true;
        }
      },
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
