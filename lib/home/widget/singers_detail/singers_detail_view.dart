import 'package:flutter/material.dart';
import 'package:flutter_advanced/home/widget/singers_detail/singer_detail_album/singer_detail_album_view.dart';
import 'package:flutter_advanced/home/widget/singers_detail/singer_detail_home/singer_detail_home_view.dart';
import 'package:flutter_advanced/home/widget/singers_detail/singer_detail_songs/singer_detail_songs_view.dart';
import 'package:flutter_advanced/home/widget/singers_detail/singer_detail_video/singer_detail_video_view.dart';
import 'package:get/get.dart';

import 'singers_detail_logic.dart';

class Singers_detailPage extends StatelessWidget {
  final logic = Get.put(Singers_detailLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(top: 190),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage("${logic.singersDetails.value.picUrl}")),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${logic.singersDetails.value.name}",
                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text("音乐数量 ${logic.singersDetails.value.musicSize}",
                                  style: TextStyle(fontSize: 13, color: Colors.white)),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 55,
                          height: 20,
                          margin: EdgeInsets.only(bottom: 50),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text("+ 关注",
                              textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.white)),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 250,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          TabBar(
                            // indicatorColor: AppColors.unactive,
                            indicatorSize: TabBarIndicatorSize.label,
                            // isScrollable: true,
                            tabs: logic.tabs,
                            controller: logic.controller,
                          ),
                        ],
                      ),
                    )),

              ],
            ),
            Expanded(
                child: TabBarView(
              controller: logic.controller,
              children: [
                Singer_detail_homePage(),
                Singer_detail_albumPage(),
                Singer_detail_songsPage(),
                Singer_detail_videoPage()
              ],
            ))
          ],
        );
      }),
    );
  }
}
