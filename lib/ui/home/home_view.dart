import 'package:flutter/material.dart';
import 'package:flutter_advanced/ui/home/view/article/article_view.dart';
import 'package:flutter_advanced/ui/home/view/explore/explore_view.dart';
import 'package:flutter_advanced/ui/home/view/music_cloud/music_cloud_view.dart';
import 'package:flutter_advanced/ui/home/view/singers/singers_view.dart';
import 'package:flutter_advanced/ui/home/view/video/video_view.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../message/message_view.dart';
import '../search_page/search_page_view.dart';
import '../search_page/widget/search_page_view2.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    state = logic.state;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Column(
        children: [
          Container(
              // padding: EdgeInsets.only(top: 2,bottom: 2),
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesIconCloud),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 25,
                              height: 25,
                            ),
                          )),
                      Expanded(
                          child: Text(
                        "dora~music",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Color(0xff595959), fontWeight: FontWeight.bold),
                      )),
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => SearchPage());
                            },
                            child: Image.asset(
                              "assets/images/icon_search.png",
                              width: 25,
                              height: 25,
                            ),
                          ))
                    ],
                  ),
                  Divider(height: 1),
                  TabBar(
                    // indicatorColor: AppColors.unactive,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    tabs: state.tabs,
                    controller: logic.state.controller,
                  ),
                ],
              )),
          Expanded(
              child: TabBarView(
            controller: logic.state.controller,
            children: [
              /// 展示View层
              SongsView(),
              ExploreView(),
              SingersView(),
              MusicCloudPage(),
              ArticlePage(),
              VideoPage()
            ],
          )),
        ],
      )),
    );
  }
}
