import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../http/service.dart';
import '../../../utils/eventbus/event_bus_handler.dart';

/// File Name: playlist
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_test All Right Reserved
/// 歌单

class PlayList extends StatefulWidget {
  String keywords;
  PlayList(this.keywords);
  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  StreamSubscription? streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchDetail(widget.keywords);
    streamSubscription = EventBusHandler.listen((event) {
      if (event.code == "4") {
        print("歌单列表刷新");
        getSearchDetail(event.data);
      }
    });
  }

  // 获取搜索结果（歌单）
  Future getSearchDetail(String keywords) async{
    ///type:1000 歌单
    Map<String, dynamic> param = {
      "keywords":keywords,
      "type": 1000,
      "limit":12
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
