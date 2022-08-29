import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../bean/hot_song.dart';
import '../../../../bean/singer_details.dart';
import '../singers_detail_logic.dart';

class Singer_detail_homePage extends StatelessWidget {
  final logic = Get.put(Singers_detailLogic());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "近期热门",
                        style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(left: 3, right: 3, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              border: new Border.all(width: 1, color: Colors.grey)),
                          child: Text(
                            "更多热歌",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(height: 1),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                      physics: new NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: HotSongItem)
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "歌手简介",
                        style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: false,
                              context: context,
                              builder: (BuildContext context) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: double.infinity,
                                      color: Colors.black54,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                          ),
                                          child: Scrollbar(
                                              child: ListView.builder(
                                            itemCount: logic.singerDetailsList.length,
                                            itemBuilder: bottomSheet,
                                          ))),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 3, right: 3, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              border: new Border.all(width: 1, color: Colors.grey)),
                          child: Text(
                            "更多信息",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(height: 1),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${logic.singersDetails.value.briefDesc ?? ""}",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context, int index) {
    SingerDetails data = logic.singerDetailsList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/icon_singer.png",
              width: 18,
              height: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text("歌手简介", textAlign: TextAlign.left),
          ],
        ),
        Divider(
          height: .5,
        ),
        Container(
          height: 5,
        ),
        Text(
          "${logic.singersDetails.value.briefDesc}",
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
        Container(
          height: 10,
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/icon_singer.png",
              width: 18,
              height: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text("${data.ti}", textAlign: TextAlign.left),
          ],
        ),
        Divider(
          height: .5,
        ),
        Container(
          height: 5,
        ),
        Text(
          "${data.txt}",
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
        Container(
          height: 10,
        ),
      ],
    );
  }

  Widget HotSongItem(BuildContext context, int index) {
    HotSong data = logic.singerHotSongs.length == 0 ? HotSong() : logic.singerHotSongs[index];
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                // margin: EdgeInsets.only(top: 8),
                child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: data.al == null
                  ? Container()
                  : CachedNetworkImage(
                      imageUrl: data.al == null ? "" : data.al!.picUrl!, width: 55, height: 55,
                      // placeholder: (context, url) => CircularProgressIndicator(color: Colors.black54,strokeWidth: 2,),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
              // Image.network(data.al==null?"":data.al!.picUrl!,width: 55,height: 55,)
            )),
            SizedBox(
              width: 10,
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
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        // "",
                        "${data.ar == null ? "" : data.ar![0].name}",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12, color: Color(0xFF15c5fc)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    child: Text(
                      "${data.al == null ? "" : data.al!.name}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
