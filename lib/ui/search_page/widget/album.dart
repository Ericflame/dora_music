import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../http/service.dart';
import '../../../utils/eventbus/event_bus_handler.dart';

/// File Name: album
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_test All Right Reserved
/// 专辑

class Album extends StatefulWidget {
  String keywords;
  Album(this.keywords);
  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  StreamSubscription? streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchDetail(widget.keywords);
    streamSubscription = EventBusHandler.listen((event) {
      if (event.code == "3") {
        print("专辑列表刷新");
        getSearchDetail(event.data);
      }
    });
  }

  // 获取搜索结果（专辑）
  Future getSearchDetail(String keywords) async{
    ///type:10 专辑
    Map<String, dynamic> param = {
      "keywords":keywords,
      "type": 10,
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
