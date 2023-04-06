import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../http/service.dart';
import '../../../utils/eventbus/event_bus_handler.dart';

/// File Name: video
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_test All Right Reserved
/// 视频

class Video extends StatefulWidget {
  String keywords;
  Video(this.keywords);
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  StreamSubscription? streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchDetail(widget.keywords);
    streamSubscription = EventBusHandler.listen((event) {
      if (event.code == "1") {
        print("视频列表刷新");
        getSearchDetail(event.data);
      }
    });
  }

  // 获取搜索结果（视频）
  Future getSearchDetail(String keywords) async{
    ///type:1014 视频
    Map<String, dynamic> param = {
      "keywords":keywords,
      "limit":6,
      "type": 1014
    };
    EasyLoading.show();
    Service.getSearchDetail(param).then((value) {
      if (value != null) {
        EasyLoading.dismiss();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
