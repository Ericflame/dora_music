import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:get/get.dart';
import '../common/singleChoose.dart';
import 'video_logic.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  String applyIndex = "0";
  String applyValue = "";
  Map<String, String> applyMap = {"0": "全部", "1": "表计电量"};
  Map<String, String> eleMap = {"0": "全部", "1": "踏勘申请"};
  Map<String, String> areaMap = {"0": "全部", "1": "所有区域"};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        // centerTitle: true,
        elevation: 0.5,
        toolbarHeight: 45,
        title: Text("test", style: TextStyle(fontSize: 14)),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(Assets.imagesBg),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color(0X40FFFFFF),
                  highlightColor: Colors.transparent,
                  onTap: () {},
                ),
              ),
            )
          ],
        )
      ),
    );
  }

}
