import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../http/service.dart';

/// File Name: radio_station
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_test All Right Reserved
/// 主播电台

class RadioStation extends StatefulWidget {
  const RadioStation({Key? key}) : super(key: key);

  @override
  State<RadioStation> createState() => _RadioStationState();
}

class _RadioStationState extends State<RadioStation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // 获取搜索结果（主播电台）
  Future getSearchDetail(String keywords) async{
    ///type:1009 主播电台
    Map<String, dynamic> param = {
      "keywords":keywords,
      "type": 1009
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
