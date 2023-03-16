import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../bean/singer_hot_album.dart';
import '../../../../../../common/E3Classical.dart';
import '../singers_detail_logic.dart';
import 'package:flustars/flustars.dart';

class Singer_detail_albumPage extends StatelessWidget {
  final logic = Get.put(Singers_detailLogic());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Obx(() {
        return EasyRefresh(
          controller: logic.refreshController,
          header: E3Classical.getHeader(),
          footer: E3Classical.getFooter(),
          child: ListView.builder(
              physics: new NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 0),
              shrinkWrap: true,
              itemCount: logic.singerAlbums.length,
              itemBuilder: SingerAlbumItem),
          onRefresh: () async {
            logic.limit.value = 10;
            logic.getSingerAlbum();
          },
          onLoad: () async {
            logic.limit.value += 10;
            logic.getSingerAlbum();
          },
        );
      }),
    );
  }

  Widget SingerAlbumItem(BuildContext context, int index) {
    SingerHotAlbum data = logic.singerAlbums.length == 0 ? SingerHotAlbum() : logic.singerAlbums[index];
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  width: 70,
                  height: 50,
                ),
                Container(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child:
                  CachedNetworkImage(
                    imageUrl: data.blurPicUrl == null?"":data.blurPicUrl!,width: 60,height: 60,
                    // placeholder: (context, url) => CircularProgressIndicator(color: Colors.black54,strokeWidth: 2,),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  // Image.network(
                  //   "${data.blurPicUrl == null?"":data.blurPicUrl!}",
                  //   width: 60,
                  //   height: 60,
                  // ),
                )),
              ],
            ),
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
                        "发行日期: ${getDate(data.publishTime!)}",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12, color: Color(0xFF15c5fc)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "歌曲数: ${data.size}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getDate(int timeUnix) {
    String now = DateUtil.formatDateStr(DateTime.fromMillisecondsSinceEpoch(timeUnix).toString(), format: "yyyy-MM-dd");
    return now;
  }
}
