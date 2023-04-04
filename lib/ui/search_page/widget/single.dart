import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import '../../../bean/search_details_songs.dart';
import '../../../common/E3Classical.dart';
import '../../../generated/assets.dart';
import '../../../http/service.dart';
import '../../../utils/eventbus/event_bus_handler.dart';

/// File Name: single
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_test All Right Reserved

class Single extends StatefulWidget {
  String keywords;
  Single(this.keywords);
  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  EasyRefreshController refreshController = EasyRefreshController();
  var singleSongList = <SearchDetailsSongs>[].obs;
  StreamSubscription? streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchDetail(widget.keywords);
    streamSubscription = EventBusHandler.listen((event) {
      if (event.code == "0") {
        print("单曲列表刷新");
        getSearchDetail(event.data);
      }
    });
  }

  // 获取搜索结果（单曲）
  Future getSearchDetail(String keywords) async{
    ///type:1 单曲
    Map<String, dynamic> param = {"keywords": keywords, "type": 1, "limit": 15};
    EasyLoading.show();
    Service.getSearchDetail(param).then((value) {
      if (value != null) {
        singleSongList.value = value.songs ?? [];
        EasyLoading.dismiss();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return EasyRefresh(
        controller: refreshController,
        footer: E3Classical.getFooter(),
        // emptyWidget: singleSongList.length == 0 ? emptyView("暂无数据") : null,
        child: ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 10),
            shrinkWrap: true,
            itemCount: singleSongList.length,
            itemBuilder: SingleItem),
        onLoad: () async {},
      );
    });
  }

  Widget SingleItem(BuildContext context, int index) {
    SearchDetailsSongs item = singleSongList[index];
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: 20, right: 15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        formSpan("${item.name ?? ""}", widget.keywords),
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Text("${item.name ?? ""}", style: TextStyle(fontSize: 14, color: Colors.black87)),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text.rich(
                            formSpan("${item.artists!.map((e) => e.name ?? "" + "/") ?? ""}", widget.keywords),
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Text(" · ",
                              style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold)),
                          Expanded(
                              child: Text.rich(
                            formSpan("${item.album!.name}", widget.keywords),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          )),
                          // Text("${item.artists!.map((e) => e.name ?? "" + "/") ?? ""}",
                          //     style: TextStyle(fontSize: 12, color: Colors.black54)),
                          // Text(" · ",style: TextStyle(fontSize: 12, color: Colors.black54,fontWeight: FontWeight.bold)),
                          // Text("${item.album!.name}",style: TextStyle(fontSize: 12, color: Colors.black54)),
                        ],
                      )
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 15),
                    child: Image.asset(Assets.imagesIconMv, width: 18, height: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 10),
                    child: Image.asset(Assets.imagesMore, width: 18, height: 18),
                  ),
                ],
              ),
              Divider(height: 20)
            ],
          )),
    );
  }

  ///高亮某些文字
  final TextStyle lightTextStyle = const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );

  InlineSpan formSpan(String src, String pattern) {
    List<TextSpan> span = [];
    List<String> parts = src.split(pattern);
    if (parts.length > 1) {
      for (int i = 0; i < parts.length; i++) {
        span.add(TextSpan(text: parts[i]));
        if (i != parts.length - 1) {
          span.add(TextSpan(text: pattern, style: lightTextStyle));
        }
      }
    } else {
      span.add(TextSpan(text: src));
    }
    return TextSpan(children: span);
  }
}
