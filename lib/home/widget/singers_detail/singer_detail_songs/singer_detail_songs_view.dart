import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../../../../bean/hot_song.dart';
import '../../../../common/E3Classical.dart';
import '../singers_detail_logic.dart';

class Singer_detail_songsPage extends StatelessWidget {
  final logic = Get.put(Singers_detailLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/icon_hot.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "收藏热门50",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Spacer(),
              Image.asset(
                "assets/images/icon_manage.png",
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 2,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "管理",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Divider(height: 1),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: EasyRefresh(
            controller: logic.refreshController,
            header: E3Classical.getHeader(),
            footer: E3Classical.getFooter(),
            child: ListView.builder(
                physics: new NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 0),
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: HotSongItem),
            onRefresh: () async {},
            onLoad: () async {},
          ))
        ],
      ),
    );
  }

  Widget HotSongItem(BuildContext context, int index) {
    HotSong data = logic.singerHotSongs.length == 0 ? HotSong() : logic.singerHotSongs[index];
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 4,
            ),
            Text(
              "${index + 1}",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${data.name ?? ""}",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      "${data.ar == null ? "" : data.ar![0].name}${data.ar != null && data.ar!.length > 1 ? "/" + data.ar![1].name! : ""}--${data.al == null ? "" : data.al!.name}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  Divider(
                    height: 1,
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/images/icon_video_start.png",
              width: 23,
              height: 23,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/images/icon_more1.png",
              width: 23,
              height: 23,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
