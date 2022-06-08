import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/common_widget.dart';
import '../common/singleChoose.dart';
import 'profile_logic.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final logic = Get.put(ProfileLogic());

  @override
  Widget build(BuildContext context) {
    String selectIndex = "0";
    String selectValue = "";
    Map<String, String> selectMap = {"0": "全部", "1": "表计电量"};
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
        title: Text("客户详情", style: TextStyle(fontSize: 14)),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CompanyWidget(context),
            Container(
              height: 10,
            ),
            Text("配电室(3个)"),
            Container(
              height: 10,
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showSingleChoose(
                  context,
                  selectMap.values.toList(),
                  (value) {
                    setState(() {});
                    //获取key
                    var key =
                        selectMap.keys.toList()[selectMap.values.toList().indexOf(selectMap.values.toList()[value])];
                    if (key == "0") {
                      //全部
                      selectValue = "";
                    }
                    selectIndex = key;
                    selectValue = selectIndex;
                    // logic.page = 0;
                    // logic.getCheckList();
                  },
                  cancelText: "取消",
                );
              },
              child: Container(
                  width: 60,
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
                        text: selectIndex == "0" ? "全部" : selectMap[selectIndex],
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
            Container(
              height: 10,
            ),
            roomWidget(context)
          ],
        ),
      ),
    );
  }

  Widget CompanyWidget(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 10, left: 5, right: 10),
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/用户.png",
                      width: 30,
                      height: 30,
                    ),
                    Container(
                      width: 5,
                    ),
                    Text(
                      "成都天投地产开发有限公司",
                      style: TextStyle(fontSize: 15),
                    ),
                    Spacer(),
                    Container(
                      width: 80,
                      child: MaterialButton(
                        height: 25,
                        color: Color(0xff169bd5),
                        elevation: 3,
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Text(
                          "企业信息",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 35,
                    ),
                    Text("客户类别", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 10,
                    ),
                    Text("配电运维类", style: TextStyle(fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 35,
                    ),
                    Text("企业产号", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 10,
                    ),
                    Text("8885445555", style: TextStyle(fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 35,
                    ),
                    Text("联系人", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 20,
                    ),
                    Text("王某", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 10,
                    ),
                    Text("18988888888", style: TextStyle(fontSize: 12)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                    ),
                    Text("企业地址", style: TextStyle(fontSize: 12)),
                    Container(
                      width: 10,
                    ),
                    Expanded(
                      child: Text("四川省成都市双流县兴隆镇三根松村村委会三根松社区三、五科学城创新孵化中心二期1号地块", style: TextStyle(fontSize: 11)),
                    )
                  ],
                ),
              ],
            ),
            Container(
              height: 10,
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Row(
              children: [
                Container(
                  width: 35,
                ),
                Text("实施经理", style: TextStyle(fontSize: 12)),
                Container(
                  width: 10,
                ),
                Text("韦志坚", style: TextStyle(fontSize: 12)),
                Container(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text("1389888888", style: TextStyle(fontSize: 12)),
                ),
                Spacer(),
                Container(
                  width: 80,
                  child: MaterialButton(
                    height: 25,
                    color: Color(0xffb8f3ff),
                    elevation: 3,
                    textColor: Colors.black,
                    onPressed: () {},
                    child: Text(
                      "现场勘探",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget roomWidget(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            // physics: new NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 0),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: roomWidgetItem));
  }

  Widget roomWidgetItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: new Border.all(width: 1, color: Colors.black),
                ),
                child: Text(
                  "icon",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 10,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("智能终端A",style: TextStyle(fontSize: 12)),
                      Container(
                        width: 5,
                      ),
                      Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: new Border.all(width: .5, color: Colors.black),
                        ),
                        child: Text(
                          "离线",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "共22个",
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffd90019),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        width: 50,
                        height: 20,
                        child: Text(
                          "离线2",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("设备编号:123123123123123123",style: TextStyle(fontSize: 12)),
                  Text("设备型号:ASDJHASDIUASD",style: TextStyle(fontSize: 12))
                ],
              ))
            ],
          ),
          Container(height: 10,),
          Wrap(
            children: [
              equipmentButton(true, "总表1"),
              SizedBox(width: 10,),
              equipmentButton(true, "局放主机"),
              SizedBox(width: 10,),
              equipmentButton(false, "水浸设备"),
              SizedBox(width: 10,),
              equipmentButton(true, "温湿度传感器"),
              SizedBox(width: 10,),
              equipmentButton(false, "温度主机"),
            ],
          )
        ],
      ),
    );
  }

  Widget equipmentButton(bool isColor, String content) {
    return Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: new Border.all(width: 1, color: Colors.black),
        ),
        child:
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: isColor ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Text(content, textAlign: TextAlign.center, style: TextStyle(fontSize: 12))
          ],
        ));
  }
}
