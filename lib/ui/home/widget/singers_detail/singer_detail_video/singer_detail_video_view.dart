import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/common/E3Classical.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import '../../../../../bean/mvs.dart';
import '../singers_detail_logic.dart';

class Singer_detail_videoPage extends StatelessWidget {
  final logic = Get.put(Singers_detailLogic());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "全部 ",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "(共50个)",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  logic.index.value = 0;
                },
                child: Text(
                  "全部",
                  style: TextStyle(fontSize: 12, color: logic.index.value == 0 ? Colors.red : Colors.black),
                ),
              ),
              Text(" | "),
              GestureDetector(
                  onTap: () {
                    logic.index.value = 1;
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2),
                    child: Text("MV",
                        style: TextStyle(fontSize: 12, color: logic.index.value == 1 ? Colors.red : Colors.black)),
                  )),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: EasyRefresh(
                    controller: logic.refreshController,
                    header: E3Classical.getHeader(),
                    footer: E3Classical.getFooter(),
                    child: ListView.builder(
                        physics: new NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 0),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: SingerMvsItem),
                    onRefresh: () async {},
                    onLoad: () async {},
                  )))
        ],
      );
    });
  }

  Widget SingerMvsItem(BuildContext context, int index) {
    Mvs data = logic.singerMvs.length == 0 ? Mvs() : logic.singerMvs[index];
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
            Container(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: data.imgurl16v9 == null ? "" : data.imgurl16v9!, width: 80, height: 55,
                // placeholder: (context, url) => CircularProgressIndicator(color: Colors.black54,strokeWidth: 1,),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.network(
              //   "${data.imgurl16v9 == null ? "" : data.imgurl16v9!}",
              //   width: 80,
              //   height: 55,
              // ),
            )),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${data.name ?? ""}",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      // "",
                      "时间: ${data.publishTime == null ? "" : data.publishTime!}",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
}
