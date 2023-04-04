import 'package:appbar_animated/appbar_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dora_music/ui/profile/profile_logic.dart';
import 'package:get/get.dart';
import 'dart:io';

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
      body: ScaffoldLayoutBuilder(
        backgroundColorAppBar:
        const ColorBuilder(Colors.transparent, Colors.blue),
        textColorAppBar: const ColorBuilder(Colors.white),
        appBarBuilder: _appBar,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.network(
                "https://www.gotravelly.com/blog/wp-content/uploads/2019/10/Gunung-Fuji-Jepang.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.36,
                ),
                height: 900,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
    return AppBar(
      backgroundColor: colorAnimated.background,
      elevation: 0,
      title: Text(
        "AppBar Animate",
        style: TextStyle(
          color: colorAnimated.color,
        ),
      ),
      leading: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: colorAnimated.color,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: colorAnimated.color,
          ),
        ),
      ],
    );
  }


}
