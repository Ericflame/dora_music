import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'profile_logic.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final logic = Get.put(ProfileLogic());
  static const platform = MethodChannel('samples');//通道名称初始化

  //异步任务，通过平台通道与特定平台进行通信，获取位置信息
  Future<void> _getPoiMessage() async {
    MethodChannel _channel = MethodChannel('samples');
    var result =
    await _channel.invokeMethod('searchAddress', {"address": "中国银行"});
    print(result);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            onPressed: () {
              // Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        // centerTitle: true,
        elevation: 0.5,
        toolbarHeight: 45,
        title: Text("我的", style: TextStyle(fontSize: 14)),
      ),
      body: GestureDetector(
        onTap: (){
          _getPoiMessage();
        },
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
          child: Center(
            child: Text("获取位置信息"),
          ),
        ),
      )
    );
  }


}
