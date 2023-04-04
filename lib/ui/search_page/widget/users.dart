import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../http/service.dart';

/// File Name: users
/// Project Name: flutter_test
/// Created By Hongzhang Chen On 2023-03-24
/// Copy Right ©2023-03-24 flutter_test All Right Reserved
/// 用户

class Users extends StatefulWidget {
  String keywords;
  Users(this.keywords);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchDetail(widget.keywords);
  }

  // 获取搜索结果（用户）
  Future getSearchDetail(String keywords) async{
    ///type:1002 用户
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
