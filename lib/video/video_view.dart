import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              // Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        // centerTitle: true,
        elevation: 0.5,
        toolbarHeight: 45,
        title: Text("踏勘进行中列表", style: TextStyle(fontSize: 14)),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Text(
                //   "任务状态:",
                //   style: TextStyle(fontSize: 10),
                // ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showSingleChoose(
                      context,
                      applyMap.values.toList(),
                      (value) {
                        setState(() {});
                        //获取key
                        var key =
                            applyMap.keys.toList()[applyMap.values.toList().indexOf(applyMap.values.toList()[value])];
                        if (key == "0") {
                          //全部
                          applyValue = "";
                        }
                        applyIndex = key;
                        applyValue = applyIndex;
                        // logic.page = 0;
                        // logic.getCheckList();
                      },
                      cancelText: "取消",
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 5),
                      constraints: BoxConstraints(minWidth: 60),
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFf0f0f0),
                      ),
                      alignment: Alignment.center,
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: applyIndex == "0" ? "全部" : applyMap[applyIndex],
                            style: TextStyle(fontSize: 10, color: Colors.black)),
                        WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 10,
                            ),
                          ),
                        )
                      ]))),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showSingleChoose(
                      context,
                      applyMap.values.toList(),
                      (value) {
                        setState(() {});
                        //获取key
                        var key =
                            applyMap.keys.toList()[applyMap.values.toList().indexOf(applyMap.values.toList()[value])];
                        if (key == "0") {
                          //全部
                          applyValue = "";
                        }
                        applyIndex = key;
                        applyValue = applyIndex;
                        // logic.page = 0;
                        // logic.getCheckList();
                      },
                      cancelText: "取消",
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 5),
                      constraints: BoxConstraints(minWidth: 60),
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFf0f0f0),
                      ),
                      alignment: Alignment.center,
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: applyIndex == "0" ? "全部" : applyMap[applyIndex],
                            style: TextStyle(fontSize: 10, color: Colors.black)),
                        WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 10,
                            ),
                          ),
                        )
                      ]))),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showSingleChoose(
                      context,
                      applyMap.values.toList(),
                      (value) {
                        setState(() {});
                        //获取key
                        var key =
                            applyMap.keys.toList()[applyMap.values.toList().indexOf(applyMap.values.toList()[value])];
                        if (key == "0") {
                          //全部
                          applyValue = "";
                        }
                        applyIndex = key;
                        applyValue = applyIndex;
                        // logic.page = 0;
                        // logic.getCheckList();
                      },
                      cancelText: "取消",
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 5),
                      constraints: BoxConstraints(minWidth: 60),
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFf0f0f0),
                      ),
                      alignment: Alignment.center,
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: applyIndex == "0" ? "全部" : applyMap[applyIndex],
                            style: TextStyle(fontSize: 10, color: Colors.black)),
                        WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 10,
                            ),
                          ),
                        )
                      ]))),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    // physics: new NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 0),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: reconnaissanceItem))
          ],
        ),
      ),
    );
  }

  Widget reconnaissanceItem(BuildContext context, index) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [Image.asset(
                  "assets/images/用户.png",
                  width: 30,
                  height: 30,
                ),
                  Container(width: 5,),
                  Text(
                    "成都天投地产开发有限公司",
                    style: TextStyle(fontSize: 15),
                  ),],
              ),
              Row(
                children: [
                  Container(width: 35,),
                  Text("企业产号:123123123", style: TextStyle(fontSize: 11)),
                  Spacer(),
                  Text("所属区域:高新区", style: TextStyle(fontSize: 11)),
                  Container(
                    width: 10,
                  ),
                ],
              ),
              Container(
                height: 5,
              ),
              Row(
                children: [
                  Container(width: 35,),
                  Text("实施经理", style: TextStyle(fontSize: 11)),
                  Container(
                    width: 10,
                  ),
                  Text("魏立坚", style: TextStyle(fontSize: 11)),
                  Container(
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text("13888888889", style: TextStyle(fontSize: 11)),
                  )
                ],
              )
            ],
          ),
          Divider(
            height: 15,
            color: Colors.black,
          ),
          Container(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset("assets/images/消息.png",width: 30,height: 30,color: index == 0?Colors.blue:Colors.black54,),
                  Text("踏勘申请",style: TextStyle(fontSize: 12,color: index == 0?Colors.blue:Colors.grey))
                ],
              ),
              Column(
                children: [
                  Container(width: 90,height: 1,color: Colors.black54,),
                  Text("等待分配",style: TextStyle(fontSize: 12,color: Colors.grey),)
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/images/任务进程.png",width: 30,height: 30,color: index == 1?Colors.blue:Colors.black54,),
                  Text("分配任务",style: TextStyle(fontSize: 12,color: index == 1?Colors.blue:Colors.grey))
                ],
              ),
              Column(
                children: [
                  Container(width: 90,height: 1,color: Colors.black54,),
                  Text("等待安装",style: TextStyle(fontSize: 12,color: Colors.grey))
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/images/调试.png",width: 30,height: 30,color: index == 2?Colors.blue:Colors.black54,),
                  Text("安装调试",style: TextStyle(fontSize: 12,color: index == 2?Colors.blue:Colors.grey))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
