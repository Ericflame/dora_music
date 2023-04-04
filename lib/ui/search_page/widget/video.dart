import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../http/service.dart';

/// File Name: video
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_test All Right Reserved
/// 视频

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // 获取搜索结果（视频）
  Future getSearchDetail(String keywords) async{
    ///type:1014 视频
    Map<String, dynamic> param = {
      "keywords":keywords,
      "type": 1002
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
